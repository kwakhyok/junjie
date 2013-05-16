<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} | 施工管理</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
    <r:require module="jsgantt"/>
    <style>
    table tr {
        cursor: pointer;
    }

    table tr.focusedTr {
        background-image: linear-gradient(left bottom, rgb(240, 237, 240) 33%, rgb(245, 237, 245) 67%, rgb(250, 242, 250) 84%);
        background-image: -o-linear-gradient(left bottom, rgb(240, 237, 240) 33%, rgb(245, 237, 245) 67%, rgb(250, 242, 250) 84%);
        background-image: -moz-linear-gradient(left bottom, rgb(240, 237, 240) 33%, rgb(245, 237, 245) 67%, rgb(250, 242, 250) 84%);
        background-image: -webkit-linear-gradient(left bottom, rgb(240, 237, 240) 33%, rgb(245, 237, 245) 67%, rgb(250, 242, 250) 84%);
        background-image: -ms-linear-gradient(left bottom, rgb(240, 237, 240) 33%, rgb(245, 237, 245) 67%, rgb(250, 242, 250) 84%);

        background-image: -webkit-gradient(linear, left bottom, right top, color-stop(0.33, rgb(240, 237, 240)), color-stop(0.67, rgb(245, 237, 245)), color-stop(0.84, rgb(250, 242, 250)));

    }

    div.hiddenProcess {
        display: none;
    }
    </style>
</head>

<body>
<div class="row-fluid sortable">

    <div class="span3">
        <g:render template="companyList"/>
    </div>

    <div class="span9">
        <g:render template="projectProcess"/>
    </div>
</div>

</body>
<r:script>
    $(function () {
        $("div.span9 div.box-header div.box-icon").hide();
        $("div.span6").remove();
        $("div#list table#companyList tbody tr").each(function (index) {
            $(this).live("click", function () {
                $("tr.focusedTr").removeClass("focusedTr");
                $(this).addClass("focusedTr");
                var companyName = $("tr.focusedTr td").text();
                //alert(companyName);
                $("div.span9 div.box div.box-header h2").html("<i class='halflings-icon list'></i><span class='break'></span>" + companyName);
                var companyIndex = index % 4;
                //alert(companyIndex);
                $("div#process div.hidden").removeClass("hidden");
                $("div#process").children().eq(companyIndex).siblings().addClass("hidden");
            });
        });
        /*$("div#process>div").each(function(index){
         $(this).children("ul#myTab li#projectProcess").live("click",function(){
         //alert(index);
         alert($("div#process").children("div.process").eq(index).children("div.hiddenProcess").html());//.removeClass("hiddenProcess");
         //$("div#process").children("div.process").eq(index).children("div.gantt").addClass("hiddenProcess");
         });
         });*/


        /*$("table#companyList tbody tr").each(function(index){
         $(this).live("click",function(){
         $("tr.focusedTr").removeClass("focusedTr");
         $(this).addClass("focusedTr");
         var companyIndex=index%4;
         //alert(companyIndex);
         $("div.hidden").removeClass("hidden");
         $("div#process").children().eq(companyIndex).addClass("hidden");//.siblings().addClass("hidden");
         });
         $("li#projectProcess").live("click",function(){
         $("div.photo hidden").removeClass("hidden");
         $("div.gantt").addClass("hidden");
         });
         $("li#projectGantt").live("click",function(){
         $("div.photo hidden").removeClass("hidden");
         $("div.gantt").addClass("hidden");
         });
         });*/

    });
</r:script>
</html>