<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-1-18
  Time: PM4:58
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="kickstart" name="layout"/>
    <title><g:message code="junjie.menus.administration" default="System"/></title>
</head>

<body>

<content tag="submenubar">
    <g:render template="submenubar" />
</content>

<div id="panelDiv"></div>

<div id="errors"></div>

<content tag="include.bottom">
    <h1> Private bottom </h1>
</content>

</body>
</html>