<%@ page import="org.apache.shiro.SecurityUtils" %>

<li class="dropdown">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white user"></i>
        <am:formatCurrentUser/>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <li><a href="#"><i class="halflings-icon white user"></i> <am:formatCurrentUser/></a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 用户简历</a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 用户简历</a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> <shiro:isLoggedIn>zzzz</shiro:isLoggedIn></a></li>

        <li><g:link controller="auth" action="signOut"><i class="halflings-icon white off"></i> <g:message
                code="junjie.logout"/></g:link></li>

    </ul>
</li>