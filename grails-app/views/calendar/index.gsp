<!DOCTYPE html>
<%@ page import="cn.com.agilemaster.TaskPlan" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 工作日志</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
    <style type="text/css">
    .external-event {
        margin: 5px;
        width: 104px;
        display: inline-block;
    }
    </style>
</head>

<body>
<div class="row-fluid sortable">
    <div class="box span12" style="margin-top: 0px">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon calendar"></i><span class="break"></span></h2>
        </div>

        <div class="box-content" style="min-height: 800px">
            <div id="external-events" class="span3 hidden-phone hidden-tablet">
                <h4>自主待办事宜</h4>

                <div class="external-event badge" style="width: 104px">普通</div>

                <div class="external-event badge badge-success">已完成</div>

                <div class="external-event badge badge-warning" style="width: 104px">紧急</div>

                <div class="external-event badge badge-important" style="width: 104px">重要</div>

                <div class="external-event badge badge-info" style="width: 104px">通知信息</div>

                <div class="external-event badge badge-inverse" style="width: 104px">其他</div>

                <p>
                    <label for="drop-remove"><input type="checkbox" id="drop-remove"/> 拖过去后删除
                    </label>
                </p>

                <div class="box noMargin" onTablet="span12" onDesktop="span12">
                    <g:render template="todo" model="[plans: plans]"/>
                </div>
            </div>

            <div id="calendar" class="span9"></div>
        </div>
    </div>

    <div class="clearfix"></div>
</div>
</div>
</div>
</body>
</html>
