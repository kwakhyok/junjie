<%@ page import="org.apache.shiro.SecurityUtils" %>
<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- start: Favicon and Touch Icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-144-precomposed.png')}"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-114-precomposed.png')}"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-72-precomposed.png')}"/>
    <link rel="apple-touch-icon-precomposed"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-57-precomposed.png')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'acm/ico', file: 'favicon.png')}"/>
    <!-- end: Favicon and Touch Icons -->
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
            <g:link controller="newHome" action="newindex" class="brand">
                <span></span>
                <img src="${createLinkTo(dir: 'img', file: 'amlogo.png')}">
            </g:link>
        <!-- start: Header Menu -->
            <div class="nav-no-collapse header-nav">
                <ul class="nav pull-right">
                    <g:render template="/newHome/messageNotification"/>
                    <!-- start: Notifications Dropdown -->
                    <g:render template="/newHome/progressNotification"/>
                    <!-- end: Notifications Dropdown -->
                    <!-- start: Message Dropdown -->
                    <g:render template="/newHome/privateNotification"/>
                    <!-- end: Message Dropdown -->
                    <!-- start: User Dropdown -->
                    <g:render template="/newHome/userOperation"/>
                    <!-- end: User Dropdown -->
                </ul>
            </div>
        <!-- end: Header Menu -->
        </div>
    </div>
</div>


<div class="container-fluid">
    <div class="row-fluid">
        <g:render template="/newHome/mainMenu"/>
        <div id="content" class="span11">
            <g:layoutBody/>
        </div>
    </div>
</div>

<footer>
    <p>
        <span style="text-align:left;float:left">&copy; <a href="" target="_blank">AgileMaster Inc.</a> 2013</span>
        <span class="hidden-phone" style="text-align:right;float:right">Powered by: <a href="#">AgileMaster</a> </span>
    </p>

</footer>

<r:layoutResources/>
</body>
</html>