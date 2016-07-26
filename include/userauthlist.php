<?php
/**
 * userauthlist.php - build table of names for authorities
 *
 * This file is part of gwloto - geekwright lockout tagout
 *
 * @copyright  Copyright © 2010 geekwright, LLC. All rights reserved.
 * @license    gwloto/docs/license.txt  GNU General Public License (GPL)
 * @author     Richard Griffith <richard@geekwright.com>
 * @package    gwloto
 */

$UserAuthList = array(
    _GWLOTO_USERAUTH_PL_ADMIN => _MD_GWLOTO_USERAUTH_PL_ADMIN_DSC,
    _GWLOTO_USERAUTH_PL_AUDIT => _MD_GWLOTO_USERAUTH_PL_AUDIT_DSC,
    _GWLOTO_USERAUTH_PL_EDIT  => _MD_GWLOTO_USERAUTH_PL_EDIT_DSC,
    _GWLOTO_USERAUTH_PL_SUPER => _MD_GWLOTO_USERAUTH_PL_SUPER_DSC,
    _GWLOTO_USERAUTH_CP_EDIT  => _MD_GWLOTO_USERAUTH_CP_EDIT_DSC,
    _GWLOTO_USERAUTH_CP_VIEW  => _MD_GWLOTO_USERAUTH_CP_VIEW_DSC,
    _GWLOTO_USERAUTH_JB_EDIT  => _MD_GWLOTO_USERAUTH_JB_EDIT_DSC,
    _GWLOTO_USERAUTH_JB_VIEW  => _MD_GWLOTO_USERAUTH_JB_VIEW_DSC,
    _GWLOTO_USERAUTH_MD_EDIT  => _MD_GWLOTO_USERAUTH_MD_EDIT_DSC,
    _GWLOTO_USERAUTH_MD_VIEW  => _MD_GWLOTO_USERAUTH_MD_VIEW_DSC,
    _GWLOTO_USERAUTH_PL_TRANS => _MD_GWLOTO_USERAUTH_PL_TRANS_DSC,
    _GWLOTO_USERAUTH_CP_TRANS => _MD_GWLOTO_USERAUTH_CP_TRANS_DSC,
    _GWLOTO_USERAUTH_MD_TRANS => _MD_GWLOTO_USERAUTH_MD_TRANS_DSC
);
