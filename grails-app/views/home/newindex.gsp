<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-3-13
  Time: PM6:57
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
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
            <a class="brand" href="#"><img src="/img/amlogo.png" alt="君捷软件"/></a>

            <!-- start: Header Menu -->
            <div class="nav-no-collapse header-nav">
                <ul class="nav pull-right">

                    <g:render template="messageNotification"/>
                    <!-- start: Notifications Dropdown -->
                    <g:render template="progressNotification"/>
                    <!-- end: Notifications Dropdown -->
                    <!-- start: Message Dropdown -->
                    <g:render template="privateNotification"/>
                    <!-- end: Message Dropdown -->


                    <!-- start: User Dropdown -->
                    <g:render template="userOperation"/>
                    <!-- end: User Dropdown -->
                </ul>
            </div>
            <!-- end: Header Menu -->

        </div>

    </div>
</div>


<div class="container-fluid">
    <div class="row-fluid" style="margin-top: -20px; margin-bottom: 0">
        <g:render template="mainMenu"/>
        <div id="content" class="span11">

            <div class="row-fluid" style="margin-top: -20px; margin-bottom: 0">

                <g:render template="news"/>

                <g:render template="investmentChart"/>

            </div>



            <div class="row-fluid" style="margin-top: -20px;padding-top: 0">

                <g:render template="gallery"/>

                <g:render template="publicCalendar"/>

            </div>

        </div>
    </div>
</div>

</body>
</html>