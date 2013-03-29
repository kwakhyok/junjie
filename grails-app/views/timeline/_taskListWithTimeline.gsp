<%@ page import="cn.com.agilemaster.TaskPlan; cn.com.agilemaster.Task" %>
<div class="dark">

<h1>时间轴</h1>

<div class="timeline">

    <g:each in="${TaskPlan.listOrderByStartDate(order: 'desc').collect {it.task}}" var="task">
        <g:set var="cssClass" value="${(task.id % 2) == 0 ? 'timeslot' : 'timeslot alt'}"/>
        <div class="${cssClass}">
            <div class="task">
                <span>
                    <span class="type">${task.title}</span>
                    <span class="details">
                        ${task.description?:'无描述'}
                    </span>
                    <span>
                        距今天
                        <span class="remaining">
                        <am:dateFromNow date="${task.currentPlan?.endDate}"/>
                        </span>
                    </span>
                </span>
                <div class="arrow"></div>
            </div>
            <div class="icon"><i class="fa-icon-map-marker"></i></div>
            <div class="time"><am:formatDate date="${task.currentPlan?.startDate}"/></div>
        </div>
        <div class="clearfix"></div>
    </g:each>
</div>

</div>
