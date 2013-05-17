<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} -- 时间轴</title>
    <meta name="layout" content="main"/>
    <r:require module="acme"/>
</head>

<body>

    <div class="span7">
        <g:render template="taskListWithPriority"/>
    </div>

    <div class="span5">
        <g:render template="taskListWithTimeline"/>
    </div>

</body>
</html>

