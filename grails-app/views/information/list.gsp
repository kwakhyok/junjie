<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>

    <g:render template="orgs" model="${organizationInstanceList}"/>

</body>
</html>