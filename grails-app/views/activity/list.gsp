
<%@ page import="cn.com.agilemaster.Activity" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-activity" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="tag" title="${message(code: 'activity.tag.label', default: 'Tag')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'activity.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'activity.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'activity.lastUpdated.label', default: 'Last Updated')}" />
			
				<th><g:message code="activity.organization.label" default="Organization" /></th>
			
				<th><g:message code="activity.task.label" default="Task" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${activityInstanceList}" status="i" var="activityInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "tag")}</g:link></td>
			
				<td>${fieldValue(bean: activityInstance, field: "description")}</td>
			
				<td><g:formatDate date="${activityInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${activityInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: activityInstance, field: "organization")}</td>
			
				<td>${fieldValue(bean: activityInstance, field: "task")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${activityInstanceTotal}" />
	</div>
</section>

</body>

</html>
