<div class="box span12">

    <table class="table table-striped table-bordered bootstrap-datatable datatable">
        <thead>
        <tr>
            <th>姓名</th>
            <th>单位</th>
            <th>电话</th>
            <th>投标项目</th>
            <th>操作..</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${cn.com.agilemaster.Specialist.list()}" var="specialist">
            <tr>
                <td>${specialist.name}</td>
                <td>${specialist.organization}</td>
                <td>${specialist.telephone}</td>
                <td>${specialist.projects.collect{it.name}}</td>
                <td>action</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
