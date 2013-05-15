<%@ page import="org.apache.shiro.SecurityUtils" %>

<li class="dropdown">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white user"></i>
        <am:formatCurrentUser/>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <li><a href="#"><i class="halflings-icon white user"></i> <am:formatCurrentUser/></a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 我的设置</a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 管理员</a></li>
        <li><a href="/dbconsole"><i class="halflings-icon white user"></i> 数据库管理</a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 用户简历</a></li>
        <shiro:isLoggedIn><li><g:link controller="auth" action="signOut"><i
                class="halflings-icon white off"></i> <g:message
                code="junjie.logout"/></g:link></li></shiro:isLoggedIn>

    </ul>
</li>