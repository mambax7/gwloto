<{include file="db:gwloto_header.tpl"}>

<div class="mediamenu">
    <table border="0" padding="0" width="100%">
        <tr>
            <td valign="bottom">
                <b><{$smarty.const._MD_GWLOTO_JOB_SEARCH_CRITERIA}></b>
            </td>
            <td align="right">
<span style="float: right;">
    <form id="jobsearch" name="jobsearch" action="listjobs.php" method="post" style="padding: 0; margin: 0; display: inline;">
<{if is_array($jobstatus) && count($jobstatus) > 0 }>
    <select name="jobstatusfilter" onChange="document.jobsearch.submit()">
    <option value=""><{$smarty.const._MD_GWLOTO_JOB_STATUS_SELECT}></option>
        <{foreach key=k item=mc from=$jobstatus }>
            <{if $k==$jobstatusfilter }>
                <option value="<{$k}>" selected><{$mc}></option>

                            <{else}>

                <option value="<{$k}>"><{$mc}></option>
            <{/if}>
        <{/foreach}>
    </select>
<{/if}>
        <input type="text" id="jobsearchterms" name="jobsearchterms" size="15" maxlength="255" value="<{$jobsearchterms}>"/>
    <input type="hidden" name="pid" value="<{$currentplace}>"/>
    <input type="submit" name="jobsearch_button" value="<{$smarty.const._MD_GWLOTO_MEDIA_SEARCH_BUTTON}>"/>
</form>
</span>
            </td>
        </tr>
    </table>
</div>

<{if isset($body)}>
    <div><{$body}></div>
<{/if}>

<{if is_array($jobs) && count($jobs) > 0 }>
    <{if !isset($joblisturl) }>
        <{assign var='joblisturl' value='viewjob.php'}>
    <{/if}>
    <br/>
    <table class='outer'>
        <tr>
            <th colspan="4"><{$smarty.const._MD_GWLOTO_JOB_RPT_TITLE}></th>
        </tr>
        <tr>
            <th><{$smarty.const._MD_GWLOTO_JOB_NAME}></th>
            <th><{$smarty.const._MD_GWLOTO_JOB_STATUS}></th>
            <th><{$smarty.const._MD_GWLOTO_JOB_WORKORDER}></th>
            <th><{$smarty.const._MD_GWLOTO_LASTCHG_ON}></th>
        </tr>
        <{foreach key=jid item=job from=$jobs }>
            <tr class="<{cycle values=" odd,even"}>">
                <td><a href="<{$joblisturl}>?jid=<{$jid}>" title="<{$job.job_description|truncate:250:'...':false}>"><{$job.job_name}></a></td>
                <td><{$job.display_job_status}></td>
                <td><{$job.job_workorder}></td>
                <td><{$job.display_last_changed_on}></td>
            </tr>
        <{/foreach}>
    </table>
<{/if}>
<{if isset($pagenav) }>
    <div class="pagenav"><{$pagenav}></div>
<{/if}>

<{if isset($debug)}>
    <br/>
    <div><{$debug}></div>
<{/if}>
