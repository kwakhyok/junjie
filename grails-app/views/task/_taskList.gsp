<table class="table table-bordered table-striped table-condensed">
    <thead>
    <g:sortableColumn property="code" title="编号"/>
    <g:sortableColumn property="title" title="任务"/>
    <g:sortableColumn property="responsive" title="责任人"/>
    <g:sortableColumn property="status" title="状态"/>
    </thead>
    <tbody>
    <g:each in="${taskList}" var="task">
        <tr>
            <td>${task.code}</td>
            <td>${task.title}</td>
            <td>${task.code}</td>
            <td>${task.status}</td>
        </tr>
    </g:each>

    </tbody>
</table>