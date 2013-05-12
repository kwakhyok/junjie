<li><a href="#">
    <img class="avatar" alt="${user.username}"
         src="<g:createLink controller='user' action='renderAvatar' id='${user.username}'/>">
</a><br>
    <strong>用户：</strong> <a href="#">${user.username}</a><br>
    <strong>姓名：</strong> <a href="#">${user.profile}</a><br>
    <strong>职位：</strong> <a href="#">${user.profile?.position}</a><br>
    <strong>电话：</strong> ${user.profile?.telephone}<br>
    <strong>邮件：</strong> ${user.profile?.email}<br>
    <strong>状态：</strong> <span class="label label-success">激活</span>
</li>