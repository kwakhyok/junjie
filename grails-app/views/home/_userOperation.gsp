<%@ page import="org.apache.shiro.SecurityUtils" %>
<g:set var="currentUser" value="${SecurityUtils.getSubject()}"/>
<li class="dropdown">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white user"></i>

        <g:if test="${currentUser?.isAuthenticated()}">
            ${currentUser.getPrincipal().toString()}
        </g:if>
        <g:else>
            <am:formatCurrentUser/>
        </g:else>
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <li><a href="#"><i class="halflings-icon white user"></i> <am:formatCurrentUser/> </a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 用户简历</a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 用户简历</a></li>
        <li><a href="#"><i class="halflings-icon white user"></i> 用户简历</a></li>
        <li><g:link controller="auth" action="signOut"><i class="halflings-icon white off"></i> <g:message code="junjie.logout"/></g:link></li>


    </ul>
</li>