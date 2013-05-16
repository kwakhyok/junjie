<%@ page import="cn.com.agilemaster.Task" %>

 <%
    def taskLabel = [drafted:'label-info',planned:'label-warning',processing:'label-important',completed: 'label-success']
    def taskText  = [drafted:'立项',planned:'分配',processing:'执行',completed: '完成']
  %>
<div class="tableMenu hidden">
    <ul class="nav nav-pills">

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">筛选任务...<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><g:remoteLink action="listLeafTasks" params="[wbsCode: 'ROOT']" update="[success: 'taskListPanel']"
                                  onSuccess="ReloadDataTable();">列出细化任务</g:remoteLink></li>
                <li><g:remoteLink action="listTopLevelTasks" params="[wbsCode: 'ROOT']" update="[success: 'taskListPanel']"
                                  onSuccess="ReloadDataTable();">列出总览任务</g:remoteLink></li>
                <li><g:remoteLink action="listLeafTasks" params="[wbsCode: 'ROOT']" update="[success: 'taskListPanel']"
                                  onSuccess="ReloadDataTable();">未计划任务</g:remoteLink></li>
            </ul>
        </li>
        <li><g:remoteLink action="planDemoTasks" params="[wbsId: 'ROOT']"
                          update="[success: 'taskListPanel']" onSuccess="ReloadDataTable();"
                          onLoading="showSpinner(true)" onComplete="showSpinner(false)">开始计划</g:remoteLink></li>
        <li><g:remoteLink action="planDemoTasks"
                          params="[wbsId: 'ROOT']" update="[success: 'taskListPanel']" onSuccess="ReloadDataTable();">恢复到初始</g:remoteLink></li>
    </ul>
</div>

<img id="taskSpinner" src="${createLinkTo(dir:'images', file:'spinner.gif')}" style="display: none" alt=""/>
<table class="table table-bordered table-hover" id="myDataTable">
    <thead>
    <th>编号</th>
    <th>名称</th>
    <th>关联项目</th>
    <th>创建时间</th>
    <th>负责人</th>
    <th>参与人</th>
    <th>截止时间</th>
    </thead>
    <tbody>
    <g:each in="${filteredTask}" var="task">
        <tr>

            <td >${task.code}</td>
            <td><span class="label ${taskLabel[task.status]}">${taskText[task.status]}</span>  ${task.title}</td>
            <td>${task.project?.name}</td>
            <td><am:dateFromNow date="${task.dateCreated}"/></td>
            <td>
                <a class="editable-assignedUser" href="#"
                   data-type="select" data-pk="${task.id}" data-original-title='负责人...'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateTaskAssignedUser')}">
                     ${task.currentPlan ? task.currentPlan?.assignedUser : 负责人}
                </a>

            </td>

            <td>
                <a class="editable-participants" href="#"
                   data-type="select" data-pk="${task.id}" data-original-title='分配...'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateTaskParticipants')}">
                    ${task.currentPlan ? task.currentPlan?.participants.collect{it.username}.join(',') : 负责人}
                </a>
            </td>

            <td>
                <a class="editable-endDate" href="#"
                   data-type="date" data-pk="${task.id}" data-format="yyyy-mm-dd" data-original-title='请分配'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateTaskEndDate')}">
                    <g:if test="${task.currentPlan}">
                        <am:dateFromNow date="${task.currentPlan.endDate}"/>
                    </g:if>
                    <g:else>
                        截止日期
                    </g:else>
                </a>
            </td>

        </tr>
    </g:each>
    </tbody>
</table>
