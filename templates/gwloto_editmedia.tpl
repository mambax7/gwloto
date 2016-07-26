<{include file="db:gwloto_header.tpl"}>

<div class="mediamenu">
    <table border="0" padding="0" width="100%">
        <{if isset($media_mode_select) }>
            <tr>
                <td align="center" colspan="2">
                    <b><{$media_mode_select}></b>
                </td>
            </tr>
        <{/if}>
        <tr>
            <td valign="bottom">
                <a href="listmedia.php?pid=<{$currentplace}>"><{$smarty.const._MD_GWLOTO_MEDIA_BROWSE}></a> |
                <a href="newmedia.php?pid=<{$currentplace}>"><{$smarty.const._MD_GWLOTO_MEDIA_ADDNEW}></a> |
                <a href="index.php?pid=<{$currentplace}>"><{$smarty.const._MD_GWLOTO_MEDIA_EXIT}></a>
            </td>
            <td align="right">
<span style="float: right;">
    <form id="mediasearch" name="mediasearch" action="listmedia.php" method="post" style="padding: 0; margin: 0; display: inline;">
<{if is_array($mediaclass) && count($mediaclass) > 0 }>
    <select name="media_class" onChange="document.mediasearch.submit()">
    <option value=""><{$smarty.const._MD_GWLOTO_MEDIA_CLASS_SELECT}></option>
        <{foreach key=k item=mc from=$mediaclass }>
            <{if $k==$media_class }>
                <option value="<{$k}>" selected><{$mc}></option>

                            <{else}>

                <option value="<{$k}>"><{$mc}></option>
            <{/if}>
        <{/foreach}>
    </select>
<{/if}>
        <input type="text" id="mediasearchterms" name="mediasearchterms" size="15" maxlength="255" value="<{$mediasearchterms}>"/>
    <input type="hidden" name="pid" value="<{$currentplace}>"/>
    <input type="submit" name="mediasearch_button" value="<{$smarty.const._MD_GWLOTO_MEDIA_SEARCH_BUTTON}>"/>
</form>
</span>
            </td>
        </tr>
    </table>
</div>

<{if isset($body)}>
    <div><{$body}></div>
<{/if}>

<{if is_array($medialist) && count($medialist) > 0 }>
    <{assign var=cols value='3'}>
    <{if isset($media_mode_select)}>
        <{assign var=cols value='4'}>
    <{/if}>
    <{if isset($media_mode_select) }>
        <form id="mediaselect" name="mediaselect" action="listmedia.php" method="post" style="padding: 0; margin: 0; display: inline;">
        <input type="hidden" name="pid" value="<{$currentplace}>"/>
    <{/if}>
    <table width='100%' border='0' cellspacing='1' class='outer'>
        <tr>
            <th colspan="<{$cols}>" align="center"><{$smarty.const._MD_GWLOTO_MEDIA_RPT_TITLE}></th>
        </tr>
        <tr>
            <{if isset($media_mode_edit) || isset($media_mode_select) }>
                <th><{$smarty.const._MD_GWLOTO_MEDIA_SELECT}></th>
            <{/if}>
            <th><{$smarty.const._MD_GWLOTO_MEDIA_NAME}></th>
            <th><{$smarty.const._MD_GWLOTO_MEDIA_CLASS}></th>
            <th><{$smarty.const._MD_GWLOTO_MEDIA_DESCRIPTION}></th>
        </tr>
        <{foreach key=mid item=ml from=$medialist }>
            <tr class="<{cycle values=" odd,even"}>">
                <{if isset($media_mode_select) }>
                    <td><input type="radio" name="mid" value="<{$ml.media_id}>"/></td>
                <{/if}>
                <td><a href="viewmedia.php?mid=<{$ml.media_id}>"><{$ml.media_name}></a></td>
                <td><{$ml.display_media_class}></td>
                <td><{$ml.media_description}></td>
            </tr>
        <{/foreach}>
        <{if isset($media_mode_select)}>
            <tr class="<{cycle values=" odd,even"}>">
                <td colspan="<{$cols}>">
                    <input type="submit" name="media_select_button" value="<{$smarty.const._MD_GWLOTO_MEDIA_SELECT_BUTTON}>"/>
                    <input type="submit" name="media_cancel_button" value="<{$smarty.const._MD_GWLOTO_MEDIA_CANCEL_BUTTON}>"/>
                </td>
            </tr>
        <{/if}>
    </table>
    <{if isset($media_mode_select) }>
        </form>
    <{/if}>
    <{if isset($pagenav) }>
        <div class="pagenav"><{$pagenav}></div>
    <{/if}>
<{/if}>

<{if isset($debug)}>
    <br/>
    <div><{$debug}></div>
<{/if}>
