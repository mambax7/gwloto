<{$xoTheme->addStylesheet('modules/gwloto/module.css')}>
<{if isset($title)}>
    <div class="content_body">
        <h1><{$title}></h1>
        <{if isset($page_message)}>
            <{$page_message}>
            <br/>
            <br/>
        <{/if}>
    </div>
<{else}>
    <{if isset($page_message)}>
        <div class="content_body"><{$page_message}><br/><br/></div>
    <{/if}>
<{/if}>
<{include file="db:gwloto_place_crumbs.tpl"}>
<{include file="db:gwloto_action_menu.tpl"}>
<{if isset($err_message)}>
    <hr/>
    <div class="errorMsg"><{$err_message}></div>
    <hr/>
<{/if}>
<{if isset($message)}>
    <hr/>
    <div class="resultMsg"><{$message}></div>
    <hr/>
<{/if}>
