<{include file="db:gwloto_header.tpl"}>
<{if isset($body)}>
    <div><{$body}></div>
<{/if}>
<{if is_array($cpoints) && count($cpoints) > 0 }>
    <br/>
    <table width='100%' border='0' cellspacing='1' class='outer'>
        <tr>
            <th colspan="5"><{$smarty.const._MD_GWLOTO_CPOINT_RPT_TITLE}></th>
        </tr>
        <tr>
            <th><{$smarty.const._MD_GWLOTO_CPOINT_RPT_NAME}></th>
            <th><{$smarty.const._MD_GWLOTO_CPOINT_RPT_DISC_STATE}></th>
            <th><{$smarty.const._MD_GWLOTO_CPOINT_RPT_RECON_STATE}></th>
            <th><{$smarty.const._MD_GWLOTO_CPOINT_RPT_TAGS_REQ}></th>
            <th><{$smarty.const._MD_GWLOTO_CPOINT_RPT_LOCKS_REQ}></th>
        </tr>

        <{foreach key=ptid item=cpoint from=$cpoints }>
            <tr class="<{cycle values=" odd,even"}>">
                <td><a href="editpoint.php?ptid=<{$cpoint.cpoint_id}>"><{$cpoint.cpoint_name}></a></td>
                <td><{$cpoint.disconnect_state}></td>
                <td><{$cpoint.reconnect_state}></td>
                <td><{$cpoint.tags_required}></td>
                <td><{$cpoint.locks_required}></td>
            </tr>
        <{/foreach}>
    </table>
<{/if}>
<{include file="db:gwloto_media_list.tpl"}>
<{if is_array($transtats) && count($transtats) > 0 }>
    <br/>
    <table width='100%' border='0' cellspacing='1' class='outer'>
        <tr>
            <th colspan="3"><{$smarty.const._MD_GWLOTO_VIEWPLAN_TRANSLATE_STATS}></th>
        </tr>
        <{foreach key=lid item=tstat from=$transtats }>
            <tr class="<{cycle values=" odd,even"}>">
                <td><{$tstat.language}></td>
                <td><{$tstat.count}></td>
                <td><{$tstat.changedate}></td>
            </tr>
        <{/foreach}>
    </table>
<{/if}>

<{if isset($debug)}>
    <br/>
    <div><{$debug}></div>
<{/if}>
