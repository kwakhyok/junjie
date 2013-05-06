<%@ page import="cn.com.agilemaster.User" %>
<g:set var="userInstanceList" value="${User.list()}"/>
<section id="list-user" class="first">

    <table class="table table-condensed" id="userTable">
        <thead>
        <tr>

            <th>username</th>

            <th>fullname</th>

            <th>email</th>

            <th>position</th>

            <th>telephone</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" status="i" var="userInstance">
            <tr>

                <td><g:link action="show"
                            id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                <td>${userInstance.profile?.lastName}${userInstance.profile?.firstName}</td>

                <td>${userInstance.profile?.email}</td>

                <td>${userInstance.profile?.position}</td>

                <td>${userInstance.profile?.telephone}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</section>