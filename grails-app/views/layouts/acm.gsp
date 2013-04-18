<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="${createLinkTo(dir:'acm/css',file:'ie.css')}" rel="stylesheet">
	<![endif]-->

    <!--[if IE 9]>
		<link id="ie9style" href="${createLinkTo(dir:'acm/css',file:'ie9.css')}" rel="stylesheet">
	<![endif]-->

    <link rel="shortcut icon" href="${createLinkTo(dir:'acm/img', file:'favicon.ico')}">

    <g:layoutHead/>
    <r:layoutResources/>

</head>

<body>
    <g:layoutBody/>
    <r:layoutResources/>
</body>
</html>