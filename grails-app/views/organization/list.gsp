
<%@ page import="cn.com.agilemaster.Organization" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-organization" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'organization.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="address" title="${message(code: 'organization.address.label', default: 'Address')}" />
			
				<g:sortableColumn property="contact" title="${message(code: 'organization.contact.label', default: 'Contact')}" />
			
				<g:sortableColumn property="scope" title="${message(code: 'organization.scope.label', default: 'Scope')}" />
			
				<g:sortableColumn property="qualification" title="${message(code: 'organization.qualification.label', default: 'Qualification')}" />
			
				<g:sortableColumn property="brand" title="${message(code: 'organization.brand.label', default: 'Brand')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${organizationInstanceList}" status="i" var="organizationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${organizationInstance.id}">${fieldValue(bean: organizationInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: organizationInstance, field: "address")}</td>
			
				<td>${fieldValue(bean: organizationInstance, field: "contact")}</td>
			
				<td>${fieldValue(bean: organizationInstance, field: "scope")}</td>
			
				<td>${fieldValue(bean: organizationInstance, field: "qualification")}</td>
			
				<td>${fieldValue(bean: organizationInstance, field: "brand")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${organizationInstanceTotal}" />
	</div>
</section>

</body>

</html>
