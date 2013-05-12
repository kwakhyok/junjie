<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 信息管理</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
</head>

<body>
<div class="row-fluid sortable">
    <div class="span12">
        <div class="box-header">
            <h2><i class="halflings-icon th"></i><span class="break"></span>信息汇总</h2>
        </div>

        <div class="box-content">
            <ul class="nav tab-menu nav-tabs" id="myTab">
                <li class="activie"><a href="#intention">意向企业</a></li>
                <li><a href="#bid">投标企业</a></li>
                <li><a href="#participant">参建企业</a></li>
                <li><a href="#specialist">专家</a></li>
                <li><a href="#blueprint">图纸库</a></li>
                <li><a href="#contact">通讯录</a></li>
                <li><a href="#rule">规章制度</a></li>
                <li><a href="#prerequisite">前期手续</a></li>





            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane " id="rule">
                    <h1>Rules</h1>

                </div>

                <div class="tab-pane " id="contact">
                    <h1>Contact</h1>

                </div>

                <div class="tab-pane " id="prerequisite">
                    <h1>前期</h1>

                </div>

                <div class="tab-pane " id="blueprint">
                    <h1>图纸</h1>
                </div>

                <div class="tab-pane " id="specialist">
                    <g:render template="specialistList"/>
                </div>

                <div class="tab-pane " id="participant">
                    <g:render template="organizationList"/>

                </div>

                <div class="tab-pane active" id="bid">
                    <g:render template="organizationList" model="[organizationList: bidingOrgs]"/>

                </div>

                <div class="tab-pane active" id="intention">
                    <g:render template="organizationList"
                              model="[organizationList: intentionOrgs]"/>
                </div>
            </div>
        </div>
    </div><!--/span-->
%{--
    <div class="span5 noMarginLeft">
        <g:render template="organizationDetail"/>
    </div>--}%

</div>
</body>
</html>