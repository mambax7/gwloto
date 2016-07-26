<{include file="db:gwloto_header.tpl"}>
<{if isset($body)}>
    <div><{$body}></div>
<{/if}>

<{if is_array($steps) && count($steps) > 0 }>
    <br/>
    <table width='100%' border='0' cellspacing='1' class='outer'>
        <tr>
            <th colspan="4"><{$smarty.const._MD_GWLOTO_STEP_RPT_TITLE}></th>
        </tr>
        <tr>
            <th><{$smarty.const._MD_GWLOTO_STEP_CPLAN}></th>
            <th><{$smarty.const._MD_GWLOTO_STEP_NAME}></th>
            <th><{$smarty.const._MD_GWLOTO_STEP_STATUS}></th>
            <th><{$smarty.const._MD_GWLOTO_STEP_ASSIGNED}></th>
        </tr>
        <{foreach key=jid item=step from=$steps }>
            <tr class="<{cycle values=" odd,even
    "}>">
                <td><a href="viewstep.php?jsid=<{$step.job_step_id}>"><{$step.cplan_name}></a></td>
                <td><{$step.step_name}></td>
                <td><{$step.display_job_step_status}></td>
                <td><{$step.assigned_name}></td>
            </tr>
        <{/foreach}>
    </table>
<{/if}>
<{include file="db:gwloto_media_list.tpl"}>
<{include file="db:gwloto_job_list.tpl"}>

<{if isset($debug)}>
    <br/>
    <div><{$debug}></div>
<{/if}>
