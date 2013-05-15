<%@ page import="cn.com.agilemaster.Message; cn.com.agilemaster.MessageRecipient" %>
<li class="dropdown hidden-phone">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white warning-sign"></i>
    </a>
    <ul class="dropdown-menu notifications">

        <li>
            <span class="dropdown-menu-title">您有20个通知</span>
        </li>

        <%
            def demoNotifications = ['新的任务下达', 'PVC地板招标公告需要您修改', '庞院长要求您催一下中控室的招标图纸',
                    '制氧机采购招标已经滞后', '地下防水发现漏水', '请签衬塑钢管购销合同']
            def mTimes = [1, 3, 5, 10, 20]
            def currentUser = session.currentUser
            currentUser?.refresh()
            def msg = Message.findAll(max:1)

        %>
        <g:if test="${currentUser}">
            <g:each in="${MessageRecipient.findAllByRecipient(currentUser)?.collect {it.message}}" status="i"
                    var="message">
            %{-- <% Collections.shuffle(mTimes) %>--}%
                <li>
                    <a href="#">+<i class="halflings-icon white user"></i><span
                            class="message">${message.title}</span><span
                            class="time">2小时</span></a>
                </li>
            </g:each>

            <li>
                <a class="dropdown-menu-sub-footer">查看所有消息提示</a>
            </li>
        </g:if>

    </ul>
</li>
