<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="loggedinacm"/>
    <r:require module="acm"/>

</head>

<body>

<div class="row-fluid" style="margin-top: -20px; margin-bottom: 0">

    <g:render template="news"/>

    <g:render template="investmentChart"/>

</div>


<div class="row-fluid" style="margin-top: -20px;padding-top: 0">

    <g:render template="gallery"/>

    <g:render template="publicCalendar"/>

</div>

<div class="row-fluid" style="margin-top: -20px;padding-top: 0">
    <g:profilerOutput/>
</div>
</body>
</html>