<{* available column list *}>
<{* job_step_id *}>
<{* job_name *}>
<{* job_workorder *}>
<{* job_description *}>
<{* step_name *}>
<{* status - step status ready to display *}>
<{* link - link to job step page *}>
<{if is_array($block) && count($block) > 0 }>
    <ul>
        <{foreach key=jsid item=jobstep from=$block }>
            <li><a href="<{$jobstep.link}>" title="<{$jobstep.job_description|truncate:250:'...':false}>"><{$jobstep.job_name}> - <{$jobstep.step_name}> - <{$jobstep.status}> </a></li>
        <{/foreach}>
    </ul>
<{/if}>
