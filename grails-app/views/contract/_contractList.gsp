<table class="table table-striped table-bordered bootstrap-datatable datatable">
    <thead>
    <tr>
        <th>编号</th>
        <th>合同名称</th>
        <th>乙方单位</th>
        <th>合同额</th>
        <th>操作..</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${contractInstance}" var="contract">
        <tr>
            <td>${contract.code}</td>
            <td>${contract.title}</td>
            <td>${contract.partyB}</td>
            <td>${contract.contractSum}</td>
            <td>...</td>
        </tr>
    </g:each>
    </tbody>
</table>