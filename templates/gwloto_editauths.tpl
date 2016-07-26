<{include file="db:gwloto_header.tpl"}>
<div><a href="index.php?pid=<{$currentplace}>"><{$smarty.const._MD_GWLOTO_USERAUTH_EXIT}></a>
    | <a href="editauths.php?pid=<{$currentplace}>"><{$smarty.const._MD_GWLOTO_USERAUTH_BY_USER}></a>
    | <a href="editgrpauths.php?pid=<{$currentplace}>"><{$smarty.const._MD_GWLOTO_USERAUTH_BY_GROUP}></a>
</div>
<{if isset($body)}>
    <div><{$body}></div>
<{/if}>

<{if is_array($report) && count($report) > 0 }>
    <br/>
    <table width='100%' border='0' cellspacing='1' class='outer'>
        <tr>
            <th colspan="3" align="center"><{$smarty.const._MD_GWLOTO_USERAUTH_RPT_TITLE}></th>
        </tr>
        <tr>
            <th><{$smarty.const._MD_GWLOTO_USERAUTH_RPT_PLACE}></th>
            <th><{$smarty.const._MD_GWLOTO_USERAUTH_RPT_AUTHS}></th>
            <th><{$smarty.const._MD_GWLOTO_USERAUTH_RPT_GROUP}></th>
        </tr>
        <{assign var='rptcnt' value=$report|@count}>
        <{section name=i start=0 loop=$rptcnt step=1 }>
            <tr class="<{cycle values=" odd,even"}>">
                <td><a href="<{$report[i].authurl}>"><{$report[i].pname}></a></td>
                <td><a href="<{$report[i].authurl}>"><{$report[i].aname}></a></td>
                <td><a href="<{$report[i].authurl}>"><{$report[i].authsource}></a></td>
            </tr>
        <{/section}>
    </table>
<{/if}>

<{if isset($debug)}>
    <br/>
    <div><{$debug}></div>
<{/if}>
