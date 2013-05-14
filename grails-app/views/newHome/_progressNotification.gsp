<%@ page import="cn.com.agilemaster.TaskPlan" %>
<g:if test="${session.currentUser}">
    <%
        def currentUser = session.currentUser
        currentUser?.refresh()
        def myTaskList = TaskPlan.findAllByAssignedUser(currentUser).collect {it.task}.unique()
    %>

    <li class="dropdown hidden-phone">
        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="halflings-icon white tasks"></i>
        </a>
        <ul class="dropdown-menu tasks">
            <li>
                <span class="dropdown-menu-title">您有<b>${myTaskList?.size()}</b>个任务正在进行中</span>
            </li>
            <g:each in="${myTaskList}" var="task">

                <am:renderTaskPercentage task="${task}"/>
            </g:each>

            <li>
                <a class="dropdown-menu-sub-footer">查看所有任务</a>
            </li>
        </ul>
    </li>

</g:if>