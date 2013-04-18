<%@ page import="org.apache.shiro.SecurityUtils" %>
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


    <link rel="shortcut icon" href="${createLinkTo(dir:'acm/img',file:'favicon.ico')}">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>

    <g:layoutHead/>
    <r:layoutResources/>

</head>

<body>

<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse"
               data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#"><img src="${createLinkTo(dir:'img',file:'amlogo.png')}"/></a>
            <!-- start: Header Menu -->
            <div class="nav-no-collapse header-nav">
                <ul class="nav pull-right">
                    <g:render template="/home/messageNotification"/>
                    <!-- start: Notifications Dropdown -->
                    <g:render template="/home/progressNotification"/>
                    <!-- end: Notifications Dropdown -->
                    <!-- start: Message Dropdown -->
                    <g:render template="/home/privateNotification"/>
                    <!-- end: Message Dropdown -->

                    <!-- start: User Dropdown -->
                    <g:render template="/home/userOperation"/>
                    <!-- end: User Dropdown -->
                </ul>
            </div>
            <!-- end: Header Menu -->
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row-fluid">
        <g:render template="/home/mainMenu"/>
        <div id="content" class="span11">
            <g:layoutBody/>
        </div>
    </div>
</div>

<footer>
    <p>
        <span style="text-align:left;float:left">&copy; <a href="" target="_blank">AgileMaster Inc.</a> 2013</span>
        <span class="hidden-phone" style="text-align:right;float:right">Powered by: <a href="#">AgileMaster</a></span>
    </p>

</footer>

<r:layoutResources/>
</body>
</html>