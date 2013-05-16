<%@ page import="cn.com.agilemaster.TaskPlan" %>
<div class="box-header">
    <h2><i class="halflings-icon check"></i><span class="break"></span>分配给我的任务
    </h2>

    <div class="box-icon">
        <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i>
        </a>
        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
    </div>
</div>
<div class="box-content">
    <div class="todo">
        <p>
            <button class="btn btn-mini btn-info">接受所有</button>
            <button class="btn btn-mini btn-info">拒绝所有</button>
            <button class="btn btn-mini btn-info">完成所有</button>
            <button class="btn btn-mini btn-info">查看更多</button>
        </p>
        <ul class="todo-list">
            <g:render template="todoEntry" collection="${plans}" var="plan"/>
        </ul>
    </div>
</div>