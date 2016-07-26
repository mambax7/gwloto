<{include file="db:gwloto_header.tpl"}>
<{if isset($body)}>
    <div><{$body}></div>
<{/if}>
<{if is_array($placesummary) && count($placesummary) > 0 }>
    <br/>
    <{foreach key=pid item=pl from=$placesummary }>
        <table width='100%' border='0' cellspacing='1' class='outer'>
            <tr>
                <th><{$pl.header}></th>
            </tr>
            <tr>
                <td><{$pl.detail}></td>
            </tr>
        </table>
    <{/foreach}>
<{/if}>
<{include file="db:gwloto_media_list.tpl"}>
<{include file="db:gwloto_job_list.tpl"}>

<{if isset($debug)}>
    <br/>
    <div><{$debug}></div>
<{/if}>
