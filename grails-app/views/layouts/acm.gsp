<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- start: Favicon and Touch Icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${createLinkTo(dir:'acm/ico',file:'apple-touch-icon-144-precomposed.png')}">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${createLinkTo(dir:'acm/ico',file:'apple-touch-icon-114-precomposed.png')}">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${createLinkTo(dir:'acm/ico',file:'apple-touch-icon-72-precomposed.png')}">
    <link rel="apple-touch-icon-precomposed" href="${createLinkTo(dir:'acm/ico',file:'apple-touch-icon-57-precomposed.png')}">
    <link rel="shortcut icon" href="${createLinkTo(dir:'acm/ico',file:'favicon.png')}">
    <!-- end: Favicon and Touch Icons -->
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
    <g:layoutBody/>
    <r:layoutResources/>
</body>
</html>