<%@ page import="org.apache.shiro.SecurityUtils" %>
<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="acm/img/favicon.ico">

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
            <a class="brand" href="#"><span>AgileMaster 0.2.1</span></a>
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
<r:layoutResources/>
</body>
</html>