<%@ page import="cn.com.agilemaster.TaskPlan" %>
<h1>任务</h1>

<g:set var="highTasks" value="${TaskPlan.findAllByPriority('high').collect {it.task}}"/>
<g:set var="mediumTasks" value="${TaskPlan.findAllByPriority('medium').collect {it.task}}"/>
<g:set var="lowTasks" value="${TaskPlan.findAllByPriority('low').collect {it.task}}"/>

<div class="priority high"><span>高度优先</span></div>
<g:each in="${TaskPlan.findAllByPriority('high').collect {it.task}}" var="hTask">
    <div class="task high">
        <div class="desc">
            <div class="title">${hTask.title}</div>

            <div>${hTask.description?:'无描述'}</div>
        </div>

        <div class="time">
            <div class="date"><am:formatDate date="${hTask.currentPlan?.endDate}"/></div>

            <div><am:dateFromNow date="${hTask.currentPlan?.endDate}"/></div>
        </div>
    </div>
</g:each>


<div class="priority medium"><span>中度优先</span></div>

<g:each in="${TaskPlan.findAllByPriority('medium').collect {it.task}}" var="hTask">
    <div class="task medium">
        <div class="desc">
            <div class="title">${hTask.title}</div>

            <div>${hTask.description?:'无描述'}</div>
        </div>

        <div class="time">
            <div class="date"><am:formatDate date="${hTask.currentPlan?.endDate}"/></div>

            <div><am:dateFromNow date="${hTask.currentPlan?.endDate}"/></div>
        </div>
    </div>
</g:each>



<div class="priority low"><span>低度优先</span></div>

<g:each in="${TaskPlan.findAllByPriority('low').collect {it.task}}" var="hTask">
    <div class="task low">
        <div class="desc">
            <div class="title">${hTask.title}</div>

            <div>${hTask.description?:'无描述'}</div>
        </div>

        <div class="time">
            <div class="date"><am:formatDate date="${hTask.currentPlan?.endDate}"/></div>

            <div><am:dateFromNow date="${hTask.currentPlan?.endDate}"/></div>
        </div>
    </div>
</g:each>


<div class="clearfix"></div>