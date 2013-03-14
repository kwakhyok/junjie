
<%@ page import="cn.com.agilemaster.Organization" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-organization" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.address.label" default="Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "address")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.contact.label" default="Contact" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "contact")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.scope.label" default="Scope" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "scope")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.qualification.label" default="Qualification" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "qualification")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.brand.label" default="Brand" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "brand")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.capital.label" default="Capital" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "capital")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.memo.label" default="Memo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: organizationInstance, field: "memo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${organizationInstance?.user?.id}">${organizationInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.activities.label" default="Activities" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${organizationInstance.activities}" var="a">
						<li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${organizationInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="organization.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${organizationInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
