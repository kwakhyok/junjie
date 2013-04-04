<div class="box span12">

    <table class="table table-striped table-bordered bootstrap-datatable datatable">
        <thead>
        <tr>
            <th>名称</th>
            <th>地址</th>
            <th>联系人</th>
            <th>电话</th>
            <th>操作..</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${organizationList}" var="org">
            <tr>
                <td>${org.name}</td>
                <td>${org.address}</td>
                <td>${org.contact}</td>
                <td>${org.telephone}</td>
                <td>action</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
