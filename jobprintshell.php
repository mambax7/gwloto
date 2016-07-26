<?php
/**
 * jobprintshell.php - setup environment and invoke jobprint plugin
 *
 * This file is part of gwloto - geekwright lockout tagout
 *
 * @copyright  Copyright © 2010 geekwright, LLC. All rights reserved.
 * @license    gwloto/docs/license.txt  GNU General Public License (GPL)
 * @author     Richard Griffith <richard@geekwright.com>
 * @package    gwloto
 */

//include ('include/common.php');
require_once __DIR__ . '/class/gwlotoPrintJob.php';

if (isset($_POST['rptid'])) {
    $currentreport = (int)$_POST['rptid'];
} elseif (isset($_GET['rptid'])) {
    $currentreport = (int)$_GET['rptid'];
}
if (!isset($currentreport)) {
    redirect_header('index.php', 3, _MD_GWLOTO_MSG_BAD_PARMS);
}

// get report parameters
if (isset($currentjob)) {
    unset($currentjob);
}
if (isset($currentplan)) {
    unset($currentplan);
}

if (isset($_POST['jid'])) {
    $currentjob = (int)$_POST['jid'];
} elseif (isset($_GET['jid'])) {
    $currentjob = (int)$_GET['jid'];
}

$currentplan = false;
if (isset($_POST['cpid'])) {
    $currentplan = (int)$_POST['cpid'];
} elseif (isset($_GET['cpid'])) {
    $currentplan = (int)$_GET['cpid'];
}

if (!isset($currentjob)) {
    redirect_header('index.php', 3, _MD_GWLOTO_MSG_BAD_PARMS);
}

$myuserid = 0;
if ($xoopsUser) {
    $myuserid = $xoopsUser->getVar('uid');
}
$language = 0; // default language
$userinfo = getUserInfo($myuserid);
if ($userinfo) {
    $language = $userinfo['language_id'];
}
if (isset($_POST['lid'])) {
    $language = (int)$_POST['lid'];
} elseif (isset($_GET['lid'])) {
    $language = (int)$_GET['lid'];
}

$user_can_view = false;
if (!$user_can_view) {
    $user_can_view = checkJobAuthority($currentjob, $myuserid, false);
}
// leave if we don't have any  authority
if (!$user_can_view) {
    $err_message = _MD_GWLOTO_MSG_NO_AUTHORITY;
    redirect_header('index.php', 3, $err_message);
}

// get report definition
$reports = getJobReports($language);

// load print specific language files
if (isset($reports[$currentreport]['language_file']) && $reports[$currentreport]['language_file'] != '') {
    $langfolders = getLanguageFolders();
    $langfile    = $reports[$currentreport]['language_file'];
    foreach ($langfolders as $lid => $folder) {
        $LANGID = $lid;
        if (file_exists('plugins/language/' . $folder . '/' . $langfile)) {
            include __DIR__ . '/plugins/language/' . $folder . '/' . $langfile;
        } else {
            include __DIR__ . '/plugins/language/english/' . $langfile;
        }
    }
}
error_reporting(E_ALL & ~E_NOTICE);
$xoopsLogger->activated = false;
require __DIR__ . '/plugins/' . $reports[$currentreport]['filename'];

//echo '<pre>$reports='.print_r($reports,true).'</pre>';

//include(XOOPS_ROOT_PATH.'/footer.php');
;
