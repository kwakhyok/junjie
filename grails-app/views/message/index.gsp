<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="">
<head>
    <title>${meta(name: 'app.name')} -- 沟通管理</title>
    <meta content="main" name="layout"/>
    <r:require modules="acme"/>
</head>

<body>
<div class="row-fluid">
    <div class="span7 noMargin">
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


    <div class="span5 noMargin" id="newMessagePanel">
        <g:render template="newMessage"/>
    </div>


    <div class="span5 noMarginLeft hide" id="showMessagePanel">
        <g:render template="messageDetail"/>

    </div>

</div>
</body>
<r:script>


    $('table.messagesList tr.messagesListRow').click(function () {
        $(this).siblings().removeClass('highlightRow');
        $(this).toggleClass('highlightRow', this.clicked);
        console.log($(this).attr('class'));
    });



    $(function () {
        if ($('#liInbox').on('click', function () {
            $('table.messagesList thead tr th.from').text("来自...");
        }));
        if ($('#liOutbox').on('click', function () {
            $('table.messagesList thead tr th.from').text("发给...");
        }));
    });

</r:script>
</html>