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
            <td><g:if test="${task.status == 'drafted'}">
                [尚未分配]
            </g:if><g:else>
                <am:formatUser user="${task.currentPlan?.assignedUser}"/>
            </g:else>
            </td>
            <td>
                <am:formatTaskStatus status="${task.status}"/>

            </td>

            <td>

                <g:if test="${task.status == 'drafted'}">
                    <shiro:hasAllRoles in="['ROLE_ADMIN', 'ROLE_USER']">
                        <g:link controller="task" action="planTaskAjax" params="[taskId: task.id]" title="分配计划"
                                data-rel="tooltip" class="btn btn-warning planTaskBtn">
                            <i class="halflings-icon edit"></i>
                        </g:link>
                    </shiro:hasAllRoles>
                </g:if>

                <g:elseif test="${task.status == 'planned' || task.status == 'processing'}">
                    <g:link controller="task" action="planTaskAjax" params="[taskId: task.id]" title="登记完成情况"
                            data-rel="tooltip" class="btn btn-warning planTaskBtn">
                        <i class="halflings-icon edit"></i>
                    </g:link>
                </g:elseif>

                <shiro:hasAllRoles in="['ROLE_ADMIN', 'ROLE_USER']">
                %{--   <g:link controller="task" action="test" params="[taskId: task.id]"
                                            class="btn btn-warning ajax-modal" href="#" title="上移" data-rel="tooltip">
                                        <i class="halflings-icon arrow-up"></i>
                                    </g:link>

                                    <g:link controller="task" action="test" params="[taskId: task.id]"
                                            class="btn btn-warning ajax-modal" href="#" title="下移" data-rel="tooltip">
                                        <i class="halflings-icon arrow-down"></i>
                                    </g:link>
                --}%
                    <g:link controller="task" action="deleteTask" params="[taskId: task.id]"
                            class="btn btn-info ajax-modal" href="#" title="删除" data-rel="tooltip">
                        <i class="halflings-icon trash"></i>
                    </g:link>
                </shiro:hasAllRoles>

            </td>
        </tr>
    </g:each>
    </tbody>
</table>