<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="">
<head>
    <title>${meta(name: 'app.name')} -- 沟通管理</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
</head>

<body>
<div class="row-fluid">
    <div class="span7">
        <div class="box-header">
            <h2><i class="halflings-icon th"></i><span class="break"></span></h2>
        </div>

        <div class="box-content">
            <ul class="nav tab-menu nav-tabs" id="myTab">
                <li id="liInbox"><a href="#inbox">收件箱</a></li>
                <li id="liOutbox" class="active"><a href="#outbox">发件箱</a></li>
            </ul>

           <g:render template="outboxMessage"/>

        </div>
    </div>


    <div class="span5 noMarginLeft" id="createPanel">

    </div>
</div>

</body>
<r:script>
    $(function(){
        if($('#liInbox').on('click',function(){
            $('table.messagesList thead tr th.from').text("来自...");
        }));
        if($('#liOutbox').on('click',function(){
            $('table.messagesList thead tr th.from').text("发给...");
        }));

        $(document).delegate('table.messagesList tr.messagesListRow', 'click', function (event, data) {
            //alert($(t);
            //$(this).siblings().removeClass('highlightRow');
            $(this).addClass('highlightRow');
            $(this).toggleClass('highlightRow',this.clicked);
            event.preventDefault();
        });

    });
</r:script>
</html>