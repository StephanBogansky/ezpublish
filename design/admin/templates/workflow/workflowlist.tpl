<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h1 class="context-title">{'%group_name [Workflow group]'|i18n( 'design/admin/workflow/workflowlist',, hash( '%group_name', $group.name ) )} </h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">

<div class="block">
    <label>{'ID'|i18n( 'design/admin/workflow/workflowlist' )}</label>
    {$group.id}
</div>

<div class="block">
    <label>{'Name'|i18n( 'design/admin/workflow/workflowlist' )}</label>
    {$group.name}
</div>

</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
<form action={'workflow/grouplist'|ezurl} method="post" name="GroupList">
    <input type="hidden" name="ContentClass_id_checked[]" value="{$group.id}" />
    <input type="hidden" name="EditGroupID" value="{$group.id}" />
    <input class="button" type="submit" name="EditGroupButton" value="{'Edit'|i18n( 'design/admin/workflow/workflowlist' )}" />
    <input class="button" type="submit" name="DeleteGroupButton" value="{'Remove'|i18n( 'design/admin/workflow/workflowlist' )}" />
</form>
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>

<form name="workflowlistform" action={concat( $module.functions.workflowlist.uri, '/', $group_id )|ezurl} method="post" name="WorkflowList">

<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h2 class="context-title"><a href={'/workflow/grouplist'|ezurl} title="{'Back to workflow groups'|i18n( 'design/admin/workflow/workflowlist' )}" /><img src={'back-button-16x16.gif'|ezimage} alt="{'Back to workflow groups'|i18n( 'design/admin/workflow/workflowlist' )}" title="{'Back to workflow groups'|i18n( 'design/admin/workflow/workflowlist' )}" /></a>&nbsp;{'Workflows [%workflow_count]'|i18n( 'design/admin/workflow/workflowlist',, hash( '%workflow_count', $workflow_list|count ) )}</h2>

{* DESIGN: Mainline *}<div class="header-subline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

{section show=$workflow_list}
<table class="list" cellspacing="0">
<tr>
    <th class="tight"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/admin/workflow/workflowlist' )}" onclick="ezjs_toggleCheckboxes( document.workflowlistform, 'Workflow_id_checked[]' ); return false;" title="{'Invert selection.'|i18n( 'design/admin/workflow/workflowlist' )}" /></th>
    <th>{'Name'|i18n( 'design/admin/workflow/workflowlist' )}</th>
    <th>{'Modifier'|i18n( 'design/admin/workflow/workflowlist' )}</th>
    <th>{'Modified'|i18n( 'design/admin/workflow/workflowlist' )}</th>
    <th class="tight">&nbsp;</th>
  </tr>
   {section var=Workflows loop=$workflow_list sequence=array( bglight, bgdark )}
       <tr class="{$Workflows.sequence}">
    <td><input type="checkbox" name="Workflow_id_checked[]" value="{$Workflows.item.id}"></td>
    <td><a href={concat( $module.functions.view.uri, '/', $Workflows.item.id )|ezurl}>{$Workflows.item.name}</a></td>
    <td>
    {let modifier=fetch( content, object, hash( object_id, $Workflows.item.modifier_id ) )}
    <a href={$modifier.main_node.url_alias|ezurl}>{$modifier.name}</a>
    {/let}
    </td>
    <td>{$Workflows.item.modified|l10n( shortdatetime )}</td>
    <td><a href={concat( $module.functions.edit.uri, '/', $Workflows.item.id )|ezurl}><img name="edit" src={'edit.png'|ezimage} width="16" height="16" alt="{'Edit'|i18n( 'design/admin/workflow/workflowlist' )}" /></a></td>
    </tr>
   {/section}
</table>
{section-else}
<div class="block">
<p>{'There are no workflows in this group.'|i18n( 'design/admin/workflow/workflowlist' )}</p>
</div>
{/section}


{* DESIGN: Content END *}</div></div></div>

{* Buttons. *}
<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
    <input class="button" type="submit" name="DeleteButton" value="{'Remove selected'|i18n( 'design/admin/workflow/workflowlist' )}" {section show=$workflow_list|not}disabled="disabled"{/section} />
    <input class="button" type="submit" name="NewWorkflowButton" value="{'New workflow'|i18n( 'design/admin/workflow/workflowlist' )}" />
    <input type="hidden" name="CurrentGroupID" value="{$group_id}" />
    <input type="hidden" name="CurrentGroupName" value="{$group_name}" />
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>
</form>
