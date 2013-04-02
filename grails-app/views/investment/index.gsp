<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} -- 投资管理</title>
    <meta name="layout" content="loggedinacm"/>
    <r:require module="acm"/>
</head>

<body>
<div class="row-fluid">

    <div class="box">
        <div class="box-header">
            <h2><i class="halflings-icon list-alt"></i><span class="break"></span>投资</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div id="sincos"  class="center" style="height:300px;" ></div>
            <p id="hoverdata">Mouse position at (<span id="x">0</span>, <span id="y">0</span>). <span id="clickdata"></span></p>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h2><i class="halflings-icon list-alt"></i><span class="break"></span>投资</h2>
            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div id="flotchart" class="center" style="height:300px"></div>
        </div>
    </div>

</body>
</html>