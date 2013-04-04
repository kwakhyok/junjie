<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 系统后台操作</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
</head>

<body>
<div class="row-fluid">

    <a class="quick-button span2">
        <i class="fa-icon-group"></i>
        <p>沟通</p>
        <span class="notification">1.367</span>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-comments-alt"></i>
        <p>监理</p>
        <span class="notification green">167</span>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-shopping-cart"></i>
        <p>采购</p>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-barcode"></i>
        <p>投资</p>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-envelope"></i>
        <p>信息</p>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-calendar"></i>
        <p>任务计划</p>
        <span class="notification red">68</span>
    </a>
    <div class="clearfix"></div>
</div>

</body>
</html>