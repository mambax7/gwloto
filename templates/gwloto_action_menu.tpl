<{if is_array($actions) && count($actions) > 0 }>
    <div class="actionmenu">
        <form style="display: inline; float: right; margin-bottom: 0.3em" name="formactions" method="post" action="menupick.php">
            <select name="menuaction" onChange="document.formactions.submit()">
                <option value="index.php" selected><{$smarty.const._MD_GWLOTO_CHOOSE_ACTION}></option>
                <{foreach key=k item=a from=$actions }>
                    <option value="<{$a.link}>"><{$a.description}></option>
                <{/foreach}>
            </select>
            <noscript><input type="submit" value="<{$smarty.const._MD_GWLOTO_NOSCRIPT_GO}>"/></noscript>
        </form>
        <br clear="all"/>
    </div>
<{/if}>
<{if isset($cbform)}>
    <div class="clipboard"><{$cbform}></div>
    <br clear='all'/>
<{/if}>
<{if is_array($cplans) && count($cplans) > 0 }>
    <div class="cplanlist">
        <table width='100%' border='0' cellspacing='1' class='outer'>
            <tr>
                <th align="center"><{$smarty.const._MD_GWLOTO_CHOOSE_CTRLPLAN}></th>
            </tr>
            <{foreach key=k item=a from=$cplans }>
                <tr class="<{cycle values=" odd,even"}>">
                    <td><a href="viewplan.php?cpid=<{$k}>"><{$a}></a></td>
                </tr>
            <{/foreach}>
        </table>
    </div>
<{/if}>
