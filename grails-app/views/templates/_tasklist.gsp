<section id="list-task" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>
            <g:sortableColumn property="title" title="${message(code: 'task.title.label', default: 'Title')}" />
            <g:sortableColumn property="description" title="${message(code: 'task.description.label', default: 'Description')}" />
            <g:sortableColumn property="startDate" title="${message(code: 'task.startDate.label', default: 'End Date')}" />
            <g:sortableColumn property="endDate" title="${message(code: 'task.endDate.label', default: 'Last Updated')}" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${taskList}" status="i" var="taskInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "title")}</g:link></td>
                <td>${fieldValue(bean: taskInstance, field: "description")}</td>
                <td><g:formatDate date="${taskInstance.startDate}" /></td>
                <td><g:formatDate date="${taskInstance.endDate}" /></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <bs:paginate total="${taskTotal}" />
    </div>
</section>