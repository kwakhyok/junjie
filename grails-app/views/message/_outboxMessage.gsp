<%@ page import="cn.com.agilemaster.Message" %>
<div class="row-fluid">
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>发信息</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>回复</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>转发信息</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>删除信息</g:link>
</div>
<hr/>
<%
    def messages = Message.findAllBySender(session.currentUser)
%>
<table class="table bootstrap-datatable datatable messagesList">
    <thead><tr>
        <th><input type="checkbox"></th>
        <th class="from">来自</th>
        <th>主题</th>
        <th>时间</th>
        <th></th>
    </tr></thead>
    <g:set var="times" value="50"/>
    <g:each in="['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'I', 'G', 'K', 'L', 'M', 'N', 'O', 'P', 'Q']"
            status="i" var="number">
        <%
            def stars = ['glyphicons star', 'glyphicons dislikes']
            def labels = ['信息': 'label label-info', '任务': 'label label-success', '问题': 'label label-warning']
            Collections.shuffle(stars)
            def cssStar = stars.get(0)
            Random generator = new Random()
            def values = labels.values().toArray()
            def keys = labels.keySet().toArray()
            def num = generator.nextInt(keys.length)
            def cssLabel = values[num]
            def label = keys[num]
        %>
        <tr class="messagesListRow">
            <td><input type="checkbox"></td>
            <td class="from"><span class="glyphicons star"><i></i></span> Eric Yi Guo<span
                    class="glyphicons paperclip"><i></i></span></td>
            <td class="title"><span class="label label-warning">problem</span> NXXXXXXXXXXX</td>
            <td class="date">Today, <b>2:22pm</b></td>
            <td>dddd</td>
        </tr>
    </g:each>
    <g:each in="${cn.com.agilemaster.MessageRecipient.findAllByRecipient(session.currentUser)}" var="recipient">
        <am:outBoxTableEntry messageRecipient="${recipient}" class="messagesListRow"/>
    </g:each>
</table>

<div class="modal hide fade" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>

        <h3>Settings</h3>
    </div>

    <div class="modal-body">
        <p>Here settings can be configured...</p>
    </div>

    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
        <a href="#" class="btn btn-primary">Save changes</a>
    </div>
</div>

<div class="clearfix"></div>