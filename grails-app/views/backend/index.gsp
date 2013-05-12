<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-5-7
  Time: AM2:04
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} | 用户后台操作</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
    <r:require module="bootstrap_editable"/>
</head>

<body>

<div class="box-header">
    <h2><i class="halflings-icon briefcase"></i><span class="break"></span></h2>
</div>

<div class="box-content">
    <ul class="nav tab-menu nav-tabs" id="myTab">
        <shiro:hasPermission permission="what:*">
            <li class="active"><a href="#firstPanel"><i class="halflings-icon share"></i>
                导入数据
            </a></li>
        </shiro:hasPermission>

        <li><a href="#secondPanel">
            <i class="halflings-icon eye-open"></i>
            后台监控</a></li>

        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="halflings-icon user"></i>
                用户
                <b class="caret"></b>
            </a>

            <ul class="dropdown-menu">
                <li class=""><a href="#thirdPanel" class=""><i class="halflings-icon user"></i> 普通用户</a></li>
                <li><a href="#" class=""><i class="fa-icon-group"></i> 群组</a></li>
                <li><a href="#" class=""><i class="halflings-icon lock"></i> 权限</a></li>
                <li><a href="#" class=""><i class="halflings-icon certificate"></i> 管理员用户</a></li>
            </ul>

        </li>

    </ul>

    <div class="tab-content" id="myTabContent">
        <div class="tab-pane active" id="firstPanel">
            <g:render template="initialize"/>
        </div>

        <div class="tab-pane" id="secondPanel">
            <g:render template="group"/>
        </div>

        <div class="tab-pane" id="thirdPanel">
            %{-- user panel --}%
            <h1>Hello</h1>
            <g:render template="user" model="[myUsers: users]"/>


            <a href="#" class="btn btn-primary" id="myBtn">列出用户</a>

            <a href="#" id="username" data-type="text" data-pk="1" data-url="/post"
               data-original-title="Enter username">superuser</a>

            <div id="listUserDiv">

            </div>

            <div id="errors">

            </div>
        </div>
    </div>

</div>

<r:script>



    $(function(){

        ajaxListUsers();



        $.fn.editable.defaults.mode='inline';
        var rowNo = $('tr.editable-row').length;
        console.log('rowNo: ' + rowNo);
        for(var i=0; i < rowNo; i++){
            var usernameId = '#editable_username_' + i.toString();
            $(usernameId).editable({
            type:'text',
            pk: 1,
            title: 'Enter username',
            success : function(response, newValue){
                if(!response.success) return response.msg;
                else return response.success;
             }
            });

            var userRolesId = '#editable_roles_' + i.toString();
            $(userRolesId).editable({
                pk: 1,
                type:'select',
                source: function(data,config){
                    $.getJSON("${createLink(controller:'user', action:'listRolesAsJson')}", {}, function(result){
                        // processing the json result;
                        console.log("getJSON results: " + result);
                    });
                },
                sourceCache: true
            });


        }

        $('#username').editable();

    });
    function ajaxListUsers(){
           $.ajax({
               type: 'POST',
               url :"${createLink(controller: 'backend', action: 'listUsers')}",
               success: function(data){
                 $('div#listUserDiv').empty();
                 $('div#listUserDiv').append(data);
               },
               error: function(data){
                  $('div#errors').append(data);
               }
       });
    }

</r:script>
</body>
</html>