<%=packageName%>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <r:require module="acme"/>
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div class="row-fluid">
    <div class="topMenu">
        <ul class="nav nav-pills">
            <li><g:link class="list" action="list">
                <i class="halflings-icon list"></i>
                <g:message code="default.list.label" args="[entityName]"/>
            </g:link>
            </li>
            <li class="active"><g:link class="create" action="create">
                <i class="halflings-icon pencil"></i>
                <g:message code="default.create.label" args="[entityName]"/>
            </g:link>
            </li>
        </ul>
    </div>

    <g:if test="\${flash.message}">
        <bootstrap:alert class="alert-info">\${flash.message}</bootstrap:alert>
    </g:if>

    <g:hasErrors bean="\${${propertyName}}">
        <bootstrap:alert class="alert-error">
            <ul>
                <g:eachError bean="\${${propertyName}}" var="error">
                    <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message
                            error="\${error}"/></li>
                </g:eachError>
            </ul>
        </bootstrap:alert>
    </g:hasErrors>

    <fieldset>
        <g:form class="form-horizontal" action="create" <%=multiPart ? ' enctype="multipart/form-data"' : '' %>>
        <fieldset>
            <f:all bean="${propertyName}"/>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="icon-ok icon-white"></i>
                    <g:message code="default.button.create.label" default="Create"/>
                </button>
            </div>
        </fieldset>
        </g:form>
    </fieldset>

</div>

</body>

</html>
