<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} -- 设计管理</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
</head>

<body>
<div class="row-fluid">
    <div class="span12">
        <g:each in="${categories}" var="catMap" status="i">
            <div class="btn-group">
                <button class="btn btn-large">${catMap.key}设计</button>
                <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <g:each in="${catMap.value}" var="cat">
                        <li><a href="#"><i class="halflings-icon star"></i>${cat.name}</a></li>
                    </g:each>
                </ul>
            </div>
        </g:each>
    </div>
    <div class="clearfix"></div>
</div>
<hr>
<div class="row-fluid">
    <div class="box-header">
        <h2><i class="halflings-icon th"></i><span class="break"></span>信息汇总</h2>
    </div>
    <div class="box-content">
        <table class="table table-striped table-bordered bootstrap-datatable datatable">
            <thead>
            <tr>
                <th>设计单位</th>
                <th>设计要求</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>交付物内容</th>
                <th>设计费用</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="[1..10]" var="org">
                <tr>
                    <td>${org}</td>
                    <td>${org}</td>
                    <td>${org}</td>
                    <td>${org}</td>
                    <td>action</td>
                    <td>action</td>
                    <td>action</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>