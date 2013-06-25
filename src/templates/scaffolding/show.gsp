<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
    <r:require module="acme"/>
	<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<div class="topMenu">
    <ul class="nav nav-pills">
        <li><g:link class="list" action="list">
            <i class="halflings-icon list"></i>
            <g:message code="default.list.label" args="[entityName]"/>
        </g:link>
        </li>
        <li><g:link class="create" action="create">
            <i class="halflings-icon pencil"></i>
            <g:message code="default.create.label" args="[entityName]"/>
        </g:link>
        </li>
    </ul>
</div>


<g:if test="\${flash.message}">
    <bootstrap:alert class="alert-info">\${flash.message}</bootstrap:alert>
</g:if>

<dl class="dl-horizontal">
    <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
    allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
    props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
    props.each { p -> %>
    <f:display bean="${propertyName}" property="${p.name}"/>
    <%  } %>
</dl>

<g:form>
    <g:hiddenField name="id" value="\${${propertyName}?.id}" />
    <div class="form-actions">
        <g:link class="btn" action="edit" id="\${${propertyName}?.id}">
            <i class="icon-pencil"></i>
            <g:message code="default.button.edit.label" default="Edit" />
        </g:link>
        <button class="btn btn-danger" type="submit" name="_action_delete">
            <i class="icon-trash icon-white"></i>
            <g:message code="default.button.delete.label" default="Delete" />
        </button>
    </div>
</g:form>

</body>

</html>
