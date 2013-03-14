<%@ page import="cn.com.agilemaster.Task" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<section id="list-task" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'task.title.label', default: 'Title')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'task.description.label', default: 'Description')}"/>

            <th><g:message code="task.project.label" default="操作"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${taskInstanceList}" status="i" var="taskInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "title")}</g:link></td>

                <td>${fieldValue(bean: taskInstance, field: "description")}</td>

                <td>
                    <ul class="nav">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message
                                    code="junjie.organization.operation"/> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="controller"><a class="registerOrganizationBtn" href="#ActivityModal" role="button"
                                                          data-toggle="modal">登记企业</a></li>
                                <li class="controller"><g:link action="delete"><g:message
                                        code="default.button.delete.label"/></g:link></li>
                            </ul>
                        </li>
                    </ul>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${taskInstanceTotal}"/>
    </div>
</section>
<g:javascript>
    $(".registerOrganizationBtn").bind('click',function(){
        alert(this.parent.parent.parent.parent.prev().text());
    });
</g:javascript>
</body>

</html>
