<?php
/**
 * clipboardform.php - setup clipboard form if appropriate
 *
 * This file is part of gwloto - geekwright lockout tagout
 *
 * @copyright  Copyright © 2010 geekwright, LLC. All rights reserved.
 * @license    gwloto/docs/license.txt  GNU General Public License (GPL)
 * @author     Richard Griffith <richard@geekwright.com>
 * @package    gwloto
 */

$showcbform    = false;
$showjobcbform = false;
$showmove      = false;
$showcopy      = true;
$clipid        = 0;
$cliptype      = '';

if (isset($places['userinfo']['clipboard_id'])) {
    $clipid = (int)$places['userinfo']['clipboard_id'];
}
if (isset($places['userinfo']['clipboard_type'])) {
    $cliptype = $places['userinfo']['clipboard_type'];
}

if ($clipid == 0) {
    $cliptype = '';
}

if ($cliptype === 'POINT') {
    if (isset($currentplan) && isset($places['currentauth'][_GWLOTO_USERAUTH_CP_EDIT])) {
        $caption    = _MD_GWLOTO_EDITPOINT_NAME;
        $selname    = getCpointName($clipid, $language);
        $idname     = 'cpid';
        $idvalue    = $currentplan;
        $showcbform = true;
        // check auth on move source
        $check_pid   = getPlaceFromCplan(getCplanFromPoint($clipid));
        $dummy       = false;
        $targetauths = array();
        buildPlaceChain($myuserid, $check_pid, $targetauths, $dummy, $dummy, $dummy);
        if (isset($targetauths[_GWLOTO_USERAUTH_CP_EDIT])) {
            $showmove = true;
        }
    }
} elseif ($cliptype === 'PLAN') {
    // switch to job add if selected a plan and navigated to a job
    if (isset($currentjob) && checkJobAuthority($currentjob, $myuserid, true)) {
        $caption     = _MD_GWLOTO_EDITPLAN_NAME;
        $selname     = getCplanName($clipid, $language);
        $cb_job_plan = $clipid;
        $cb_job_id   = $currentjob;
        // don't show if currentplan is already on job
        $jobcplans     = getJobCplanIds($cb_job_id);
        $showjobcbform = (!isset($jobcplans[$cb_job_plan]));
    } else {
        if (isset($currentplace) && isset($places['currentauth'][_GWLOTO_USERAUTH_CP_EDIT])) {
            $caption    = _MD_GWLOTO_EDITPLAN_NAME;
            $selname    = getCplanName($clipid, $language);
            $idname     = 'pid';
            $idvalue    = $currentplace;
            $showcbform = true;
            // check auth on move source
            $check_pid = getPlaceFromCplan($clipid);
            if ($check_pid != $currentplace) {
                $dummy       = false;
                $targetauths = array();
                buildPlaceChain($myuserid, $check_pid, $targetauths, $dummy, $dummy, $dummy);
                if (isset($targetauths[_GWLOTO_USERAUTH_CP_EDIT])) {
                    $showmove = true;
                }
            }
        }
    }
} elseif ($cliptype === 'PLACE') {
    if (isset($currentplace) && isset($places['currentauth'][_GWLOTO_USERAUTH_PL_EDIT])) {
        $caption = _MD_GWLOTO_EDITPLACE_NAME;
        $selname = getPlaceName($clipid, $language);
        $idname  = 'pid';
        $idvalue = $currentplace;
        // don't show if currentplace is under clipboard place
        $showcbform = !isset($places['chainup'][$clipid]);
        $showmove   = true;
        $showcopy   = false;
    }
} elseif ($cliptype === 'JOB') {
    if (isset($currentplan) && !isset($currentjob) && isset($places['currentauth'][_GWLOTO_USERAUTH_JB_EDIT])) {
        $caption     = _MD_GWLOTO_JOB_NAME;
        $selname     = getJobName($clipid, $language);
        $cb_job_plan = $currentplan;
        $cb_job_id   = $clipid;
        // don't show if currentplan is already on job
        $jobcplans     = getJobCplanIds($cb_job_id);
        $showjobcbform = (!isset($jobcplans[$cb_job_plan]));
    }
}

if ($showcbform) {
    $token = true;

    $form = new XoopsThemeForm(_MD_GWLOTO_CLIPBOARD_FORM, 'formcb1', 'select.php', 'POST', $token);

    $form->addElement(new XoopsFormLabel($caption, $selname, 'sel_name'), false);

    $form->addElement(new XoopsFormHidden($idname, $idvalue));

    if ($showmove) {
        $form->addElement(new XoopsFormButton('', 'op_move', _MD_GWLOTO_MOVE_SELECTED, 'submit'));
    }

    if ($showcopy) {
        $form->addElement(new XoopsFormButton('', 'op_copy', _MD_GWLOTO_COPY_SELECTED, 'submit'));
    }

    $form->addElement(new XoopsFormButton('', 'op_cancel', _MD_GWLOTO_CANCEL_SELECTED, 'submit'));

    $cbform = $form->render();
    $xoopsTpl->assign('cbform', $cbform);
}

if ($showjobcbform) {
    $token = true;

    $form = new XoopsThemeForm(_MD_GWLOTO_CLIPBOARD_JOB_FORM, 'formcb2', 'viewstep.php', 'POST', $token);

    $form->addElement(new XoopsFormLabel($caption, $selname, 'sel_name'), false);

    $form->addElement(new XoopsFormHidden('cpid', $cb_job_plan));
    $form->addElement(new XoopsFormHidden('jid', $cb_job_id));

    $form->addElement(new XoopsFormButton('', 'op_addstep', _MD_GWLOTO_STEP_ADD_THIS_BUTTON, 'submit'));

    $form->addElement(new XoopsFormButton('', 'op_cancel', _MD_GWLOTO_STEP_ADD_CANCEL_BUTTON, 'submit'));

    $cbform = $form->render();
    $xoopsTpl->assign('cbform', $cbform);
}
