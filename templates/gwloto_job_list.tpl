<{if is_array($jobs) && count($jobs) > 0 }>
    <{if !isset($joblisturl) }>
        <{assign var='joblisturl' value='viewjob.php'}>
    <{/if}>
    <br/>
    <table class='joblist'>
        <tr>
            <th colspan="4"><{$smarty.const._MD_GWLOTO_JOB_RPT_TITLE}></th>
        </tr>
        <tr>
            <th><{$smarty.const._MD_GWLOTO_JOB_NAME}></th>
            <th><{$smarty.const._MD_GWLOTO_JOB_STATUS}></th>
            <th><{$smarty.const._MD_GWLOTO_JOB_WORKORDER}></th>
            <th><{$smarty.const._MD_GWLOTO_JOB_STARTDATE}></th>
        </tr>
        <{foreach key=jid item=job from=$jobs }>
            <tr class="<{cycle values=" odd,even"}>">
                <td><a href="<{$joblisturl}>?jid=<{$jid}>" title="<{$job.job_description|truncate:250:'...':false}>"><{$job.job_name}></a></td>
                <td><{$job.display_job_status}></td>
                <td><{$job.job_workorder}></td>
                <td><{$job.job_startdate}></td>
            </tr>
        <{/foreach}>
    </table>
<{/if}>
