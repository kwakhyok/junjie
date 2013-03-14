
<%@ page import="cn.com.agilemaster.Activity" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-activity" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="activity.tag.label" default="Tag" /></td>
				
				<td valign="top" class="value">${activityInstance?.tag?.encodeAsHTML()}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="activity.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: activityInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="activity.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${activityInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="activity.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${activityInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="activity.organization.label" default="Organization" /></td>
				
				<td valign="top" class="value"><g:link controller="organization" action="show" id="${activityInstance?.organization?.id}">${activityInstance?.organization?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="activity.task.label" default="Task" /></td>
				
				<td valign="top" class="value"><g:link controller="task" action="show" id="${activityInstance?.task?.id}">${activityInstance?.task?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
