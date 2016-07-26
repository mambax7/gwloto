<?php
/**
 * index.php - admin page for about and configuration messages
 *
 * This file is part of gwloto - geekwright lockout tagout
 *
 * @copyright  Copyright © 2010 geekwright, LLC. All rights reserved.
 * @license    gwloto/docs/license.txt  GNU General Public License (GPL)
 * @author     Richard Griffith <richard@geekwright.com>
 * @package    gwloto
 */

include __DIR__ . '/header.php';

echo $moduleAdmin->addNavigation(basename(__FILE__));
$welcome = _AD_GW_ADMENU_WELCOME;
$moduleAdmin->addInfoBox($welcome);
$moduleAdmin->addInfoBoxLine($welcome, _AD_GW_ADMENU_MESSAGE, '', '', 'information');

// build todo list
$todo    = array();
$todocnt = 0;

$op = '';
if (isset($fixmp_status)) {
    unset($fixmp_status);
}
if (isset($_GET['op'])) {
    $op = cleaner($_GET['op']);
}
if ($op === 'fixmp') {
    // try and make the upload directory
    $pathname     = getMediaUploadPath();
    $mode         = 0700;
    $recursive    = true;
    $fixmp_status = mkdir($pathname, $mode, $recursive);
}

// check mysql version
$mysqlversion_required = '4.1.0';

$sql    = 'select version() as version';
$result = $xoopsDB->queryF($sql);
if ($result) {
    while ($myrow = $xoopsDB->fetchArray($result)) {
        $mysqlversion = $myrow['version'];
    }
    if (version_compare($mysqlversion, $mysqlversion_required) < 0) {
        $message = sprintf(_MI_GWLOTO_AD_TODO_MYSQL, $mysqlversion_required, $mysqlversion);
        $moduleAdmin->addConfigBoxLine('<span style="color:orange"><img src="../images/admin/warn.png" alt="!" />' . $message . '</span>', 'default');
    }
}

// check for InnoDB support in mysql. We should have bombed out in install, but ...

$have_innodb = false;

$sql    = 'show ENGINES';
$result = $xoopsDB->queryF($sql);
if ($result) {
    while ($myrow = $xoopsDB->fetchArray($result)) {
        if ($myrow['Engine'] === 'InnoDB' && ($myrow['Support'] === 'YES' || $myrow['Support'] === 'DEFAULT')) {
            $have_innodb = true;
        }
    }
}
if (!$have_innodb) {
    $message = _AD_GWLOTO_AD_TODO_INNODB;
    $moduleAdmin->addConfigBoxLine('<span style="color:orange"><img src="../images/admin/warn.png" alt="!" />' . $message . '</span>', 'default');

}

// check for tcpdf
$tcpdf_path = '';
$tcpdf_path = $xoopsModuleConfig['tcpdf_path'];
if ($tcpdf_path != '' && !file_exists($tcpdf_path)) {
    $message = _MI_GWLOTO_AD_TODO_TCPDF_NOTFND;
    $moduleAdmin->addConfigBoxLine('<span style="color:orange"><img src="../images/admin/warn.png" alt="!" />' . $message . '</span>', 'default');
} else {
    if ($tcpdf_path == '') {
        if (!file_exists('../tcpdf/tcpdf.php') && !file_exists(XOOPS_ROOT_PATH . '/libraries/tcpdf/tcpdf.php')) {
            $message = _MI_GWLOTO_AD_TODO_TCPDF_INSTALL;// .sprintf(_MI_GWLOTO_AD_TODO_TCPDF_GENERAL,XOOPS_ROOT_PATH.'/modules/'.$xoopsModule->getVar('dirname').'/tcpdf/');
            $moduleAdmin->addConfigBoxLine('<span style="color:orange"><img src="../images/admin/warn.png" alt="!" />' . $message . '</span>', 'default');
        } else {
            if (!file_exists('../tcpdf/tcpdf.php')) {
                $message = _MI_GWLOTO_AD_TODO_TCPDF_UPGRADE; // .sprintf(_MI_GWLOTO_AD_TODO_TCPDF_GENERAL,XOOPS_ROOT_PATH.'/modules/'.$xoopsModule->getVar('dirname').'/tcpdf/');
                $moduleAdmin->addConfigBoxLine('<span style="color:orange"><img src="../images/admin/warn.png" alt="!" />' . $message . '</span>', 'default');
            }
        }
    }
}

// check for a top level place
$sql    = 'SELECT count(*) as rowcount FROM ' . $xoopsDB->prefix('gwloto_place') . ' WHERE parent_id=0';
$result = $xoopsDB->query($sql);
$cnt    = 0;
if ($result) {
    $myrow = $xoopsDB->fetchArray($result);
    $cnt   = $myrow['rowcount'];
}
if ($cnt == 0) {
    $message = _MI_GWLOTO_AD_TODO_PLACES;
    $moduleAdmin->addConfigBoxLine('<span style="color:orange"><img src="../images/admin/warn.png" alt="!" />' . $message . '</span>', 'default');
}

// check media upload directory permissions
$pathname = getMediaUploadPath();
$moduleAdmin->addConfigBoxLine($pathname, 'folder');

// display todo list
echo $moduleAdmin->renderIndex();

include __DIR__ . '/footer.php';
