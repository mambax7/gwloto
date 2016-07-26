<?php
/**
 * uninstall.php - cleanup on module uninstall
 *
 * This file is part of gwloto - geekwright lockout tagout
 *
 * @copyright  Copyright © 2010 geekwright, LLC. All rights reserved.
 * @license    gwloto/docs/license.txt  GNU General Public License (GPL)
 * @author     Richard Griffith <richard@geekwright.com>
 * @package    gwloto
 */

defined('XOOPS_ROOT_PATH') || exit('XOOPS root path not defined');

function xoops_module_uninstall_gwloto(&$module)
{
    // currently nothing to do
    $module->setErrors('Uninstall Post-Process Completed');
    return true;
}
