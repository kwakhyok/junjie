<table class="table table-bordered table-striped table-condensed">
    <thead>
    <g:sortableColumn property="code" title="编号"/>
    <g:sortableColumn property="title" title="任务"/>

    <g:sortableColumn property="responsive" title="责任人"/>


    <g:sortableColumn property="status" title="状态"/>
    <th>操作</th>
    </thead>
    <tbody>
    <g:each in="${taskList}" var="task">
        <tr class="center">
            <td>${task.code}</td>
            <td>${task.title}</td>
            <td> <g:if test="${task.status=='drafted'}">
                    [尚未分配]
                </g:if><g:else>
                    ${task.plans?.find{true}.assignedUser}
                </g:else>
            </td>

            <td>${task.status}</td>

            <td>
                <g:if test="${task.status=='drafted'}">
                    <g:link controller="task" action="planTaskAjax" params="[taskId: task.id]" title="计划" data-rel="tooltip" class="btn btn-warning planTaskBtn">
                        <i class="halflings-icon edit"></i>
                    </g:link>
                    <g:link controller="task" action="test" params="[taskId: task.id]" class="btn btn-warning ajax-modal" href="#" title="上移" data-rel="tooltip">
                        <i class="halflings-icon arrow-up"></i>
                    </g:link>

                    <g:link controller="task" action="test" params="[taskId: task.id]" class="btn btn-warning ajax-modal" href="#" title="下移" data-rel="tooltip">
                        <i class="halflings-icon arrow-down"></i>
                    </g:link>

                    <g:link controller="task" action="deleteTask" params="[taskId: task.id]" class="btn btn-info ajax-modal" href="#" title="下移" data-rel="tooltip">
                        <i class="halflings-icon trash"></i>
                    </g:link>
                </g:if>

            </td>
        </tr>
    </g:each>
    </tbody>
</table>