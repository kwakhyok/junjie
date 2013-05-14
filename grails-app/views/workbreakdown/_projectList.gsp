<%@ page import="cn.com.agilemaster.Project" %>


<div class="projectTableMenu hidden">
    <ul class="nav nav-pills">

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">筛选子项目...<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><g:remoteLink action="listLeafTasks" params="[wbsCode: 'ROOT']" update="[success: 'taskListPanel']"
                                  onSuccess="ReloadProjectDataTable();" onComplete="showSpinner(false)"
                                  onLoading="showSpinner(true)">列出细化项目</g:remoteLink></li>
                <li><g:remoteLink action="listTopLevelTasks" params="[wbsCode: 'ROOT']"
                                  update="[success: 'taskListPanel']"
                                  onSuccess="ReloadProjectDataTable();">列出总览项目</g:remoteLink></li>
            </ul>
        </li>
        <li><g:remoteLink action="planDemoTasks" params="[wbsId: 'ROOT']"
                          update="[success: 'taskListPanel']"
                          onSuccess="ReloadProjectDataTable();">开始关联采购招标</g:remoteLink></li>
        <li><g:remoteLink action="planDemoTasks"
                          params="[wbsId: 'ROOT']" update="[success: 'taskListPanel']"
                          onSuccess="ReloadProjectDataTable();">恢复到初始</g:remoteLink></li>
    </ul>
</div>

<img id="projectSpinner" src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" style="display: none" alt=""/>
<table class="table table-bordered" id="projectDataTable">
    <thead>
    <th>编号</th>
    <th>名称</th>
    <th>创建时间</th>
    </thead>
    <tbody>
    <g:each in="${filteredProjects}" var="project">
        <tr>
            <td>${project.code}</td>
            <td>${project.name}</td>
            <td><am:dateFromNow date="${project.dateCreated}"/></td>
        </tr>
    </g:each>
    </tbody>
</table>
