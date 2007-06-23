<form method="post" action={concat( '/visual/templateedit/', $template )|ezurl}>
 <input type="hidden" name="type" value="{$type}" />
<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{'Edit template: <%template>'|i18n( 'design/admin/visual/templateedit',, hash( '%template', $template ) )|wash}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">
<div class="block">

<textarea class="box" name="TemplateContent" cols="40" rows="30">{$template_content|wash(xhtml)}</textarea>

</div>
</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">

{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">

{if $redirect|ne( '' )}

<input type="hidden" name="RedirectToURI" value="{$redirect}" />

{/if}

<input type="hidden" name="filterString"  value="{$filterString}" />
{section show=$is_writable}
<input class="button" type="submit" name="SaveButton" value="{'Apply changes'|i18n( 'design/admin/visual/templateedit' )}" title="{'Click this button to save the contents of the text field above to the template file.'|i18n( 'design/admin/visual/templateedit' )}" />
{section-else}
<input class="button-disabled" disabled="disabled" type="submit" name="SaveButton" value="{'Apply changes'|i18n( 'design/admin/visual/templateedit' )}" title="{'You do not have permissions to save the contents of the text field above to the template file.'|i18n( 'design/admin/visual/templateedit' )}" />
{/section}

<input class="button" type="submit" name="DiscardButton" value="{'Back'|i18n( 'design/admin/content/browse' )}" title="{'Back'|i18n( 'design/admin/content/browse' )}" />
</div>

{* DESIGN: Control bar END *}</div></div></div></div></div></div>

</div>

</div>

</form>
