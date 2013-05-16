<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="">
<head>
    <title>${meta(name: 'app.name')} -- 沟通管理</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
    <style type="text/css">
    tr.highlightRow {
        border-left: 2px solid red;
        border-right: 2px solid red;
    }
    </style>
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

        $('a.replyBtn').bind('click', function (event, data) {
            console.log($(this).html());
            $('newMessage').removeClass('hide');
            $('messageDetail').addClass('hide');
        });


        $("li#liInbox").bind("click", function () {
            $("div#inputBox").show();
            $("div#outputBox").hide();
        });
        $("li#liOutbox").bind("click", function () {
            $("div#inputBox").hide();
            $("div#outputBox").show();
        });
        $("li select").hide();
        $("div .box-content table.table tbody tr.messagesListRow td a.replyBtn").click(function () {
            $('div#newMessagePanel').show();
            $('div#showMessagePanel').hide();
            //selectMail(回复);
            var message = $(this).parent().parent();
            var messageFrom = message.children("td.messageTitle").text().substr(19);
            var messageTag = message.children("td.messageTitle").text().substring(9, 11);
            $("div#newMessagePanel input#messageTitle").attr("value", "回复-" + messageFrom);
            $("div ul.chzn-choices").children().remove();
            $("div ul li").eq(0).removeClass("active-result").addClass("result-selected");
            $("div#recipients_chzn ul.chzn-choices").prepend("<li class='search-choice' id='tags_chzn_c_0'><span>admin</span><a href='javascript:void(0)' class='search-choice-close' rel='0'></a></li>");
            $("div#tags_chzn ul.chzn-choices").prepend("<li class='search-choice' id='tags_chzn_c_0'><span>" + messageTag + "</span><a href='javascript:void(0)' class='search-choice-close' rel='0'></a></li>");


        });
        $("div .box-content table.table tbody tr.messagesListRow td a.forwardBtn").click(function () {
            $('div#newMessagePanel').show();
            $('div#showMessagePanel').hide();
            //selectMail(转发);
            var message = $(this).parent().parent();
            var messageFrom = message.children("td.messageTitle").text().substr(19);
            var messageTag = message.children("td.messageTitle").text().substring(9, 11);
            $("div#newMessagePanel input#messageTitle").attr("value", "转发-" + messageFrom);
            $("div ul.chzn-choices").children().remove();
            $("div ul li").eq(0).removeClass("active-result").addClass("result-selected");
            $("div#recipients_chzn ul.chzn-choices").prepend("<li class='search-choice' id='tags_chzn_c_0'><span>admin</span><a href='javascript:void(0)' class='search-choice-close' rel='0'></a></li>");
            $("div#tags_chzn ul.chzn-choices").prepend("<li class='search-choice' id='tags_chzn_c_0'><span>" + messageTag + "</span><a href='javascript:void(0)' class='search-choice-close' rel='0'></a></li>");


        });
        $("div .box-content table.table tbody tr.messagesListRow").click(function () {
            $(".highlightRow").removeClass("highlightRow");
            $(this).addClass("highlightRow");
        });

        $("div .box-content table.table tbody tr.messagesListRow td a.replyBtn").parent().siblings().click(function () {
            $('div#newMessagePanel').hide();
            $('div#showMessagePanel').show();
        });


    });



</r:script>
</html>