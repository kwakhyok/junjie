<%@ page import="cn.com.agilemaster.MessageRecipient" %>
<%
    def pms = MessageRecipient.findAllByRecipient(session.currentUser)?.collect{it.message}
    %>
<li class="dropdown hidden-phone">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white envelope"></i>
    </a>
    <ul class="dropdown-menu messages">
        <li>
            <span class="dropdown-menu-title">您有${pms.size()}条消息</span>
        </li>

        <g:each in="${pms}" var="pm">
           <li>
               <a href="#">
                   <span class="avatar"><img src="${createLinkTo(dir:'acm/img',file:'avatar.jpg')}"></span>
                   <span class="header"><span class="from">${pm.sender?.profile}</span></span>
                   <span class="time"><am:dateFromNow date="${pm.dateCreated}"/></span>
                   <span class="message">${pm.title}</span>
               </a>
           </li>
        </g:each>

        <li>
            <a href="#">
                <span class="avatar"><img src="/acm/img/avatar.jpg" alt="Avatar"></span>
                <span class="header">
                    <span class="from">
                        庞玉成
                    </span>
                    <span class="time">
                        6 min
                    </span>
                </span>
                <span class="message">
                    幕墙招标公告什么时候贴出？
                </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="avatar"><img src="/acm/img/avatar2.jpg" alt="Avatar"></span>
                <span class="header">
                    <span class="from">
                        梁晶
                    </span>
                    <span class="time">
                        56 min
                    </span>
                </span>
                <span class="message">
                    PVC地板的招标报告已经草拟
                </span>
            </a>
        </li>


        <li>
            <a href="#">
                <span class="avatar"><img src="/acm/img/avatar5.jpg" alt="Avatar"></span>
                <span class="header">
                    <span class="from">
                        庞玉成
                    </span>
                    <span class="time">
                        2012-09-19
                    </span>
                </span>
                <span class="message">
                    总包施工合同
                </span>
            </a>
        </li>
        <li>
            <a class="dropdown-menu-sub-footer">查看所有</a>
        </li>
    </ul>
</li>