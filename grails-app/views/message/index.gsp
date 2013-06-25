<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="">
<head>
    <title>${meta(name: 'app.name')} -- 沟通管理</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
    <ckeditor:resources/>

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




    function sendSuccessMsg(){
        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'信息已经发送',
                // (string | mandatory) the text inside the notification
            text:'',
            // (string | optional) the image to display on the left
            sticky: false
        }) ;
    }

    function remoteShowMessage(msgId){
       ${remoteFunction(action:'ajaxShow', controller: 'message',
            params: '\'id=\'+msgId', update: [success: 'showMessagePanel', error: 'errors'])}
    }

    $(function(){
        $('tr.messagesListRow').bind('click',function(evet,data){
            $('#newMessagePanel').hide();
            $('#showMessagePanel').fadeIn('slow');
            var msgId = $(this).find('input').first().val();
            remoteShowMessage(msgId);
        });
    });


    $(function(){
         $('a#ajaxtest').bind('click',function(event,data){
            var link = $(this);
            var content = $('div#ajaxtestDiv');
            content.empty();
            $.ajax({
                url:link.attr("href"),
                type:'post',
                dataType: "html",
                error: function(){
                    console.log("AJAX - error() ") ;
                },
                beforeSend: function(){
                    console.log('Before Sending... ');
                },
                complete: function(){
                    console.log('completing...');
                    content.fadeIn('slow');
                },
                success:function(data){
                    console.log('success...');
                    content.html(data);

                }
            });
            console.log('after completing...');
            content.fadeIn('slow');
            return (false);
         });
    });



</r:script>
</html>