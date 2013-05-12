<%@ page import="cn.com.agilemaster.Task" %>


<div class="tableMenu hidden">
    <ul class="nav nav-pills">
        <li><g:remoteLink action="listLeafTasks" params="[wbsCode: 'ROOT']" update="[success:'taskListPanel']">列出细化任务</g:remoteLink></li>
        <li><g:remoteLink action="listLeafTasks" params="[wbsCode: 'ROOT']" update="[success:'taskListPanel']">已计划任务</g:remoteLink></li>
        <li><g:remoteLink action="listLeafTasks" params="[wbsCode: 'ROOT']" update="[success:'taskListPanel']">未计划任务</g:remoteLink></li>
        <li><a href="#">按项目查看</a></li>
    </ul>
</div>
<table class="table table-bordered" id="myDataTable">
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
            <td>${task.code}</td>
            <td>${task.title}</td>
            <td>${task.project}</td>
            <td><am:dateFromNow date="${task.dateCreated}"/></td>
            <td>
                <a class="editable-assignedUser" href="#"
                   data-type="select" data-pk="${task.id}" data-original-title='负责人...'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateTaskAssignedUser')}">
                    负责人
                </a>
            </td>

            <td>
                <a class="editable-participants" href="#"
                   data-type="select" data-pk="${task.id}" data-original-title='分配...'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateTaskParticipants')}">
                    参与人
                </a>
            </td>

            <td>
                <a class="editable-endDate" href="#"
                   data-type="date" data-pk="${task.id}" data-format="yyyy-mm-dd" data-original-title='请分配'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateTaskEndDate')}">
                    截止日期
                </a>
            </td>

        </tr>
    </g:each>
    </tbody>
</table>

