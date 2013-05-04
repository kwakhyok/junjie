<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 合同管理</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
</head>

<body>
<div class="row-fluid sortable">
    <div class="span7">
        <div class="box-header">
            <h2><i class="halflings-icon th"></i><span class="break"></span>合同汇总</h2>
        </div>

        <div class="box-content">
            <ul class="nav tab-menu nav-tabs" id="myTab">
                <li class="active"><a href="#account">合同台账</a></li>
                <li><a href="#payment">合同付款</a></li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active" id="account">
                    <g:render template="contractList" bean="${ledgerList}" var="contractList"/>
                </div>

                <div class="tab-pane" id="payment">
                    <g:render template="contractList" bean="${paymentList}" var="contractList"/>

                </div>
            </div>
        </div>
    </div><!--/span-->

    <div class="span5 noMarginLeft" id="contractDetail">
        <g:render template="contractDetail" bean="${contractInstance}"/>
    </div>
</div>
</body>

<r:script>
    function remoteGetContract(contractId){
        ${remoteFunction(controller: 'contract', action: 'ajaxGetContract',
        params: '\'id=\'+contractId', update: [success: 'contractDetail', error: 'errors'])}
    }

    $('.contractClickRow').click(function(){
        var contractId =  $(this).children(".hidden-id").text();
        $(this).siblings().removeClass('highlightRow');
        $(this).toggleClass('highlightRow',this.clicked);
        remoteGetContract(contractId);
    });

</r:script>
</html>