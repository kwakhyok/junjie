<%@ page import="cn.com.agilemaster.Organization" %>



			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="organization.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${organizationInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'address', 'error')} ">
				<label for="address" class="control-label"><g:message code="organization.address.label" default="Address" /></label>
				<div class="controls">
					<g:textField name="address" value="${organizationInstance?.address}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'address', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'contact', 'error')} ">
				<label for="contact" class="control-label"><g:message code="organization.contact.label" default="Contact" /></label>
				<div class="controls">
					<g:textField name="contact" value="${organizationInstance?.contact}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'contact', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'scope', 'error')} ">
				<label for="scope" class="control-label"><g:message code="organization.scope.label" default="Scope" /></label>
				<div class="controls">
					<g:textField name="scope" value="${organizationInstance?.scope}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'scope', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'qualification', 'error')} ">
				<label for="qualification" class="control-label"><g:message code="organization.qualification.label" default="Qualification" /></label>
				<div class="controls">
					<g:textField name="qualification" value="${organizationInstance?.qualification}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'qualification', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'brand', 'error')} ">
				<label for="brand" class="control-label"><g:message code="organization.brand.label" default="Brand" /></label>
				<div class="controls">
					<g:textField name="brand" value="${organizationInstance?.brand}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'brand', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'capital', 'error')} ">
				<label for="capital" class="control-label"><g:message code="organization.capital.label" default="Capital" /></label>
				<div class="controls">
					<g:field type="number" name="capital" value="${organizationInstance.capital}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'capital', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'memo', 'error')} ">
				<label for="memo" class="control-label"><g:message code="organization.memo.label" default="Memo" /></label>
				<div class="controls">
					<g:textArea name="memo" cols="40" rows="5" maxlength="300" value="${organizationInstance?.memo}"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'memo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'user', 'error')} ">
				<label for="user" class="control-label"><g:message code="organization.user.label" default="User" /></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${cn.com.agilemaster.User.list()}" optionKey="id" value="${organizationInstance?.user?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'user', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'activities', 'error')} ">
				<label for="activities" class="control-label"><g:message code="organization.activities.label" default="Activities" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${organizationInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['organization.id': organizationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: organizationInstance, field: 'activities', 'error')}</span>
				</div>
			</div>

