<%@ page import="cn.com.agilemaster.MessageRecipient" %>
<div class="row-fluid">
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>发信息</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>回复</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>转发信息</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>删除信息</g:link>
</div>
<%
    def messages = MessageRecipient.findAllByRecipient(session.currentUser).collect {it.message}
%>
<hr/>
<table class="table bootstrap-datatable datatable messagesList">
    <thead><tr>
        <th class="checkbox"><input type="checkbox"></th>
        <th class="from">来自</th>
        <th class="title">主题</th>
        <th class="date">时间</th>
        <th></th>
    </tr></thead>
%{--    <g:each in="${messages}" var="message">
        <tr>
            <td class="checkbox"><input type="checkbox"></td>
            <td class="from">${message.sender?.profile}</td>
            <td class=""><span class="glyphicons-icon dislikes"></span><i></i></td>
            <td class="attachment"></td>
            <td class="message">${message.title}</td>
            <td class="date"><am:dateFromNow date="${message.dateCreated}"/></td>
            <td class="operations">operations</td>
        </tr>
    </g:each>--}%
</table>
<div class="modal hide fade" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>

        <h3>Settings</h3>
    </div>

    <div class="modal-body">
        <p>弹出</p>
    </div>

    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
        <a href="#" class="btn btn-primary">Save changes</a>
    </div>
</div>

<div class="clearfix"></div>