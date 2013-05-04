<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-3-14
  Time: PM3:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="cn.com.agilemaster.Task" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 范围管理</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require modules="acm"/>
</head>

<body>

<div class="row-fluid sortable">
    <div class="box span6">
        <div class="box-header">
            <h2><i class="halflings-icon align-justify"></i><span class="break"></span>WBS工作分解模型</h2>

            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>

        <div class="box-content">
            <table class="table" id="wbsTable">
                <thead>
                <tr>
                    <th class="hidden">ID</th>
                    <g:sortableColumn property="code" title="编号"/>
                    <g:sortableColumn property="title" title="年限|标记"/>
                    <th>任务总数</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${WBSList}" var="wbs">
                    <tr>
                        <td class="hidden hidden-id">${wbs.id}</td>
                        <td class="center clickableRow">${wbs.code}</td>
                        <td class="center clickableRow">${wbs.title}</td>
                        <td class="center clickableRow">${wbs.tasks.size()}</td>
                        <td class="center clickableRow">
                            <g:if test="${wbs.status == 'on-progress'}">
                                <span class="label label-important">未完成</span>
                            </g:if><g:else>
                            <span class="label label-success">已完成</span>
                        </g:else>
                        </td>
                        <td class="center">
                            <g:remoteLink update="taskList" id="${wbs.id}" class="btn btn-warning noty"
                                          data-noty-options='{"text":"This is a success information","layout":"top","type":"information"}'
                                          controller="task" action="addDemoPlan" title="加入计划"
                                          data-rel="tooltip">
                                <i class="halflings-icon edit"></i>
                            </g:remoteLink>
                        </td>
                    </tr>
                </g:each>
                </tbody>

            </table>
        </div>
    </div>

    <div class="box span6">

        <div class="box-header">
            <h2><i class="halflings-icon align-justify"></i><span class="break"></span>PBS项目分解模型</h2>

            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>

        <div class="box-content">
            <table class="table" id="pbsTable">
                <thead>
                <tr>
                    <th class="hidden">ID</th>
                    <g:sortableColumn property="code" title="编号"/>
                    <g:sortableColumn property="title" title="年限|标记"/>
                    <th>任务总数</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${PBSList}" var="pbs">
                    <tr>
                        <td class="hidden hidden-id">${pbs.id}</td>
                        <td class="center pbsClickableRow">${pbs.code}</td>
                        <td class="center pbsClickableRow">${pbs.title}</td>
                        <td class="center pbsClickableRow">${pbs.tasks?.size()}</td>
                        <td class="center pbsClickableRow">
                            <g:if test="${pbs.status == 0}">
                                <span class="label label-important">尚未完成</span>
                            </g:if><g:else>
                            <span class="label label-success">已完成</span>
                        </g:else>
                        </td>
                        <td class="center">
                            <g:remoteLink class="btn btn-warning" id="${pbs.id}" update="taskList" controller="task"
                                          action="addDemoPlan" title="加入计划"
                                          data-rel="tooltip">
                                <i class="halflings-icon edit"></i>
                            </g:remoteLink>
                        </td>
                    </tr>
                </g:each>
                </tbody>

            </table>
        </div>
    </div> <!-- / span -->
</div>  <!-- /row -->

<hr>

<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header">
            <h2><i class="halflings-icon align-justify"></i><span class="break"></span><span id="tasksTitle">任务列表</span>
            </h2>

            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>

        <div class="box-content" id="taskListDiv">

        </div>

    </div> <!-- /span-->
</div>  <!-- /row -->
<div id="taskList">
    %{--
        <g:render template="taskList" bean="taskList"/>
    --}%
</div>




<div class="modal hide fade" id="planTaskModal" style="display: block;">
</div>


<g:render template="/templates/activityForm" model="[task: task]"/>

</body>

<r:script>



    function remoteUpdateMe(myValue){
            ${remoteFunction(controller: 'task', action: 'ajaxListTasks', update: [success: 'taskListDiv', failure: 'errors'],
                params: '\'wbsId=\'+myValue')}
    }

    function remoteUpdatePBSTasks(pbsValue){
        ${remoteFunction(controller: 'task', action: 'ajaxListTasksPBS', update: [success: 'taskListDiv', failure: 'errors'],
                params: '\'pbsId=\'+pbsValue')}
    }

    $(remoteUpdateMe('3'));
    $('.clickableRow').click(function () {
    //$(this).closest("tr").siblings().removeClass("highlightRow");
    console.log(this);
    var wbsId = $(this).siblings('.hidden-id').text();
    $('.highlightRow').removeClass("highlightRow");
    $(this).parents("tr").toggleClass("highlightRow", this.clicked);
    if ($(this).closest("table").attr('id') === 'pbsTable') {
        $('#tasksTitle').text(" PBS工作分解-- 任务列表");
    } else if ($(this).closest("table").attr('id') === 'wbsTable') {
           $('#tasksTitle').text(" WBS工作分解-- 任务列表");
    }
    //console.log(wbsId);
    remoteUpdateMe(wbsId);



    });

    $('.pbsClickableRow').click(function(){

    var pbsId = $(this).siblings('.hidden-id').text();
        $('.highlightRow').removeClass("highlightRow");
        $(this).parents("tr").toggleClass("highlightRow", this.clicked);
        $('#tasksTitle').text("PBS工作分解-- 任务列表");
        remoteUpdatePBSTasks(pbsId);
    });

    $('.planTaskBtn').live('click',function(){
        var url = $(this).attr('href');
        $('#planTaskModal').load(url, function(){
           $(this).modal({show:true});
        });
        return false;
    });

</r:script>
</html>