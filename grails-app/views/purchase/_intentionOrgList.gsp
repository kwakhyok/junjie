<div class="intentionOrgTableMenu hidden">
    <ul class="nav nav-pills">
        <li><g:remoteLink action="ajaxImportIntentionOrgs" update="[success: 'intentionOrgListPanel']"
                          onSuccess="reLoadIntentionOrgDataTable()"
                          onLoading="showSpinner(true, '#intentionOrgSpinner')"
                          onComplete="showSpinner(false,'#intentionOrgSpinner')">导入意向企业</g:remoteLink></li>
        <li><a href="#">恢复初始</a></li>
    </ul>
</div>
<img id="intentionOrgSpinner" src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" style="display: none" alt=""/>

<table class="table table-striped table-bordered" id="intentionOrgDataTable">
    <thead>
    <tr>

        <th>名称</th>
        <th>地址</th>
        <th>联系人</th>
        <th>电话</th>
        <th>项目</th>
        <th>操作..</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${orgs}" var="org">
        <tr>
            <td>${org.name}</td>
            <td>${org.address}</td>
            <td>${org.contact}</td>
            <td>${org.telephone}</td>
            <td>${org.activities.collect {it.memo}.join(',')}</td>
            <td>action</td>
        </tr>
    </g:each>
    </tbody>
</table>