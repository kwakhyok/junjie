<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="${createLinkTo(dir:'acm/img', file:'favicon.ico')}">

    <g:layoutHead/>
    <r:layoutResources/>

</head>

<body>
    <g:layoutBody/>
    <r:layoutResources/>
</body>
</html>