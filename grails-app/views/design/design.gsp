<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-5-17
  Time: AM9:26
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="{session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} | 设计管理</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
    <style type="text/css">
        .table tr:hover{
            cursor: pointer;
        }
    </style>
</head>

<body>
<%

%>
<div class="row-fluid hideInIE8">
    <div class="span12">
        <div class="circleStats">
            <g:render template="designCircleStat" collection="${categories}" var="category"/>
        </div>

    </div>
</div>

<div class="row-fluid">
    <div class="span4">
        <div style="border:1px dotted; min-height: 600px">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        <g:render template="groupSelect" />
                    </th>
                    <th>

                    </th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${categories}" var="cat">
                    <tr>
                        <td>${cat.name}</td>
                        <td> <span class="red" style="border: 1px solid">1 ${cat.num} </span></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <div class="span8" onTablet="span12" onDesktop="span8">

        <div class="box span6" onTablet="span12" onDesktop="span6">
            <g:render template="designPaperTasks"/>
        </div>

        <div class="box span6" onTablet="span12" onDesktop="span6">
            <g:render template="designCommunication" />
        </div>
    </div>
</div>
</body>

</html>