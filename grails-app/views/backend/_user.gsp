<table class="table">
    <thead>
    <tr>
        <th style="width:40"></th>
        <th>用户名</th>
        <th>姓名</th>
        <th>角色分配</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${myUsers}" var="user" status="i">
        <tr class="editable-row" style="width:40">
            <td>
                <g:if test="${user.profile?.photo}">
                    <img src="<g:createLink controller='user' action='renderAvatar' id='${user.username}'/>"/>
                </g:if>
            </td>
            <td>
                ${user.username}
            </td>
            <td>
                <a href="#" id="editable_username_${i}" data-type="text"
                   data-url="${createLink(controller: 'backend', action: 'postUser')}">${user.profile}</a>
            </td>

            <td>
                <a href="#" id="editable_roles_${i}" data-type="select"
                   data-url="${createLink(controller: 'backend', action: 'postUser')}">
                    ${user.roles*.name.join(',')}
                </a>
            </td>

        </tr>
    </g:each>
    </tbody>
</table>
<ul class="dashboard-list">
    <g:render template="/user/dashboardUserEntry" collection="${myUsers}" var="user"/>
</ul>

<div id="userPanel">

</div>
