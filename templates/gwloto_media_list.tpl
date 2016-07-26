<{if (is_array($media) && count($media) > 0) || isset($attach_type) }>
    <{assign var=cols value='3'}>
    <{if isset($attach_type)}>
        <{assign var=cols value='4'}>
    <{/if}>
    <div>
        <br/>
        <{if isset($attach_type) }>
        <form id="attachedselect" name="attachedselect" action="detachmedia.php" method="post" style="padding: 0; margin: 0; display: inline;">
            <{/if}>
            <table class='medialist'>
                <tr>
                    <th colspan="<{$cols}>"><{$smarty.const._MD_GWLOTO_ATTACHED_MEDIA_TITLE}></th>
                </tr>
                <tr>
                    <{if is_array($media) && count($media) > 0 }>
                    <{if isset($attach_type) }>
                        <th><{$smarty.const._MD_GWLOTO_MEDIA_SELECT}></th>
                    <{/if}>
                    <th><{$smarty.const._MD_GWLOTO_MEDIA_NAME}></th>
                    <th><{$smarty.const._MD_GWLOTO_MEDIA_REQUIRED}></th>
                    <th><{$smarty.const._MD_GWLOTO_MEDIA_CLASS}></th>
                </tr>
                <{foreach key=maid item=mitem from=$media }>
                    <tr class="<{cycle values=" odd,even"}>">
                        <{if isset($attach_type) }>
                            <td><input type="radio" name="maid" value="<{$mitem.media_attach_id}>"/></td>
                        <{/if}>
                        <td><a href="dlmedia.php?mid=<{$mitem.media_id}>&lid=<{$language}>" title="<{$mitem.media_description|truncate:250:'...':false}>" target="_blank"><{$mitem.media_name}></a></td>
                        <td><{$mitem.display_required}></td>
                        <td><{$mitem.display_media_class}></td>
                    </tr>
                <{/foreach}>
                <{/if}>
                <{if isset($attach_type) }>
                    <tr>
                        <td>
                            <{if is_array($media) && count($media) > 0 }>
                                <input type="submit" name="media_detach_button" value="<{$smarty.const._MD_GWLOTO_MEDIA_DETACH_BUTTON}>" onClick="return confirm('<{$smarty.const._MD_GWLOTO_MEDIA_DETACH_CONFIRM}>')"/>
                            <{/if}>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td align="right">
                            <a href="selectmedia.php?type=<{$attach_type}>&id=<{$generic_id}>"><{$smarty.const._MD_GWLOTO_ATTACH_MEDIA}></a>
                        </td>
                    </tr>
                <{/if}>
            </table>
            <{if isset($attach_type) }>
        </form>
        <{/if}>
    </div>
<{/if}>
