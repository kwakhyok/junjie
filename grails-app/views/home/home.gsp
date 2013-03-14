<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-3-14
  Time: AM10:51
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>君捷软件</title>
    <meta name="layout" content="acm"/>
    <r:require module="acm"/>
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
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row-fluid">

        <g:render template="projectIntro"/>

        <g:render template="login" />

    </div>

    <hr>

    <div class="row-fluid">
        <g:render template="news"/>
        <g:render template="biddingBoard"/>
    </div>

</div>

</body>
</html>