<{if !isset($crumburl) }>
    <{assign var='crumburl' value='index.php'}>
<{/if}>
<{if !isset($crumbextra) }>
    <{assign var='crumbextra' value=''}>
<{/if}>
<{if !isset($crumbpcurl) }>
    <{assign var='crumbpcurl' value='index.php'}>
<{/if}>
<{if !isset($crumbpcextra) }>
    <{assign var='crumbpcextra' value=''}>
<{/if}>
<{if is_array($crumbs) && count($crumbs) > 0 }>
    <div class="breadcrumb">
        <{assign var='crumb_count' value=$crumbs|@count}>
        <a href="index.php?pid=0"><img src="images/all.png" alt="<{$smarty.const._MD_GWLOTO_ALL_AUTH_PLACES}>" title="<{$smarty.const._MD_GWLOTO_ALL_AUTH_PLACES}>" style="vertical-align: middle;"/> </a>
        <{section name=i start=0 loop=$crumb_count step=1 }>
            &gt;
            <a href="<{$crumburl}>?pid=<{$crumbs[i].id}><{$crumbextra}>"><{$crumbs[i].name}></a>
        <{/section}>
        <{if is_array($choose) && count($choose) > 0 }>
            &gt;
            <form style="display: inline;" name="formpc" method="get" action="<{$crumbpcurl}>">
                <select name="pid" onChange="document.formpc.submit()">
                    <option value="0" selected><{$smarty.const._MD_GWLOTO_CHOOSE_PLACE}></option>
                    <{foreach key=pid item=choice from=$choose }>
                        <option value="<{$pid}>"><{$choice}></option>
                    <{/foreach}>
                </select>
                <{$crumbpcextra}>
                <noscript><input type="submit" value="<{$smarty.const._MD_GWLOTO_NOSCRIPT_GO}>"/></noscript>
            </form>
        <{/if}>
    </div>
    <hr/>
<{else}>
    <{if is_array($choose) && count($choose) > 0 }>
        <div class="placechooser">
            <form name="formpc" method="get" action="<{$crumbpcurl}>">
                <select name="pid" onChange="document.formpc.submit()">
                    <option value="0" selected><{$smarty.const._MD_GWLOTO_CHOOSE_PLACE}></option>
                    <{foreach key=pid item=choice from=$choose }>
                        <option value="<{$pid}>"><{$choice}></option>
                    <{/foreach}>
                </select>
                <noscript><input type="submit" value="<{$smarty.const._MD_GWLOTO_NOSCRIPT_GO}>"/></noscript>
            </form>
        </div>
        <hr/>
    <{/if}>
<{/if}>
