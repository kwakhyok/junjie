<%@ page import="cn.com.agilemaster.ContractDocument" %>
<table class="table bootstrap-datatable datatable table-hover" id="contractListTable">
    <thead>
    <tr>
        <th class="hidden">id</th>
        <th>编号</th>
        <th>合同名称</th>
        <th>乙方单位</th>
        <th>合同额(万)</th>
        <th>签订时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${contractList}" var="contract">
        <tr class="contractClickRow">
            <td class="hidden hidden-id">${contract.id}</td>
            <td>${contract.code}</td>
            <td>${contract.title}</td>
            <td>${contract.partyB}</td>
            <td>${Math.floor(contract.contractSum/10000)}</td>
            <td><am:formatDate date="${contract.dateCreated}"/></td>
            <td><a class="btn btn-danger" href="#">
                <i class="halflings-icon trash halflings-icon"></i>
            </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
<button class="btn btn-primary">新合同</button>
