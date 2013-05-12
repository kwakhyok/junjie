<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 工作日志</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
</head>

<body>
<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon calendar"></i><span class="break"></span>工作日历安排</h2>
        </div>

        <div class="box-content">

            <ul class="nav tab-menu nav-tabs" id="myTab">
                <li  class="active"><a href="#myCalendar">我的工作安排</a></li>
                <li><a href="#myDiary">我的工作日志</a></li>
                <li><a href="#othersDiary">同事们的工作日志</a></li>

            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane" id="myDiary">
                    <h2>我的工作日志</h2>
                </div>

                <div class="tab-pane" id="othersDiary">
                    <h2>同志们的工作日志</h2>
                </div>

                <div class="tab-pane active" id="myCalendar">
                    <div id="external-events" class="span3 hidden-phone hidden-tablet">
                        <h4>待安排事项</h4>

                        <div class="external-event badge">普通</div>

                        <div class="external-event badge badge-success">已完成</div>

                        <div class="external-event badge badge-warning">紧急</div>

                        <div class="external-event badge badge-important">重要</div>

                        <div class="external-event badge badge-info">通知信息</div>

                        <div class="external-event badge badge-inverse">其他</div>

                        <p>
                            <label for="drop-remove"><input type="checkbox" id="drop-remove"/> 拖过去后删除</label>
                        </p>
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
