<%@ page import="cn.com.agilemaster.Organization; cn.com.agilemaster.BidSection" %>
<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-5-14
  Time: PM12:06
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="{session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} | 招标管理</title>
    <style type="text/css">
    .timeslot .task:hover {
        border: 2px solid #8c23ff;
        background: #aabffe;
        cursor: pointer;
    }

    .timeslot .task:active {
        border: 2px solid #8c23ff;
        background: #aabffe;
        cursor: pointer;
    }
    </style>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
    <r:require module="bootstrap_editable"/>
</head>

<body>
<%
    def stepList = ['企业报名', 'FAQ答疑', '确认投标企业', '现场开标',
            '登记投标企业针对标段的报价', '企业二次报价', '评委打分表',
            '符合性审查表', '综合评比', '评标结果(入围或者直接中标)',
            '发布评标结果公告', '三次四次报价', '选定中标单位', '最终发布中标结果']
%>
<div class="row-fluid">
    <div class="row-fluid">
        <am:boxContainer icon="list" canFold="false" span="12" title="标段总览">
            <ul class="nav tab-menu nav-tabs" id="myTab">
                <li class="active" id="bidSectionTab"><a href="#bidSectionPanel"><i class="fa-icon-list"></i><span
                        class="break"></span>招标标段</a></li>
                <li id="intentOrgTab"><a href="#intentionOrgPanel"><i class="fa-icon-user-md"></i><span
                        class="break"></span>意向企业</a></li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active" id="bidSectionPanel">
                    <div id="bidSectionListPanel">
                        <g:render template="bidSectionList" model="[filteredBidSections: BidSection.list()]"/>
                    </div>
                </div>

                <div class="tab-pane" id="intentionOrgPanel">
                    <div id="intentionOrgListListPanel" class="span11">
                        <g:render template="intentionOrgList" model="[orgs: Organization.list()]"/>
                    </div>
                </div>
            </div>

        </am:boxContainer>
    </div>

    <div class="row-fluid">
        <am:boxContainer icon="th" canFold="false" span="12" title="招标流程">

            <div class="container-fluid" style="padding: 0">
                <div class="row-fluid">

                    <div class="span5 noMargin">
                        <div class="timeline">
                            <g:each in="${stepList}" var="step" status="i">
                                <div class="${i % 2 == 0 ? 'timeslot' : 'timeslot alt'}">
                                    <div class="task">
                                        <span>
                                            <span class="type">第${i + 1}步</span>
                                            <span class="details">${step}</span>
                                        </span>

                                        <div class="arrow"></div>
                                    </div>

                                    <div class="icon"><i class="fa-icon-map-marker"></i></div>

                                    <div class="time">${i + 1}</div>
                                </div>
                            </g:each>
                        </div>
                    </div>

                    <div class="span7 noMargin">
                        <h1 class="xxxx">SPAN7</h1>
                    </div>

                </div>
            </div>
        </am:boxContainer>
    </div>
</div>

</body>
<r:script>
    $(function () {

        $('div.task').bind('click', function () {
            $('h1.xxxx').html($(this).html());
        });
        reLoadBidSectionDataTable();
        $('li#bidSectionTab').bind('click', function (event, data) {
            //$('div#intentionOrgPanel').empty();
            reLoadBidSectionDataTable();
        });

        $('li#intentOrgTab').bind('click', function (event, data) {
            //$('div#bidSectionPanel').empty();
            reLoadIntentionOrgDataTable();
        });

    });

    function reLoadBidSectionDataTable() {
        $.fn.editable.defaults.mode = 'popup';
        $('.editable-assignedUser').editable({
            value:1,
            source:[
                {value:1, text:'郭奕'},
                {value:2, text:'成仔'}
            ]
        });
        $('.editable-participants').editable({
            value:2,
            source:[
                {value:1, text:'郭奕'},
                {value:2, text:'成仔'}
            ]
        });

        $('.editable-endDate').editable({
            datepicker:{
                weekStart:1
            }
        });

        $('table#bidSectionDataTable').dataTable({
            "sDom":"<'row-fluid'<'span4 bidSectionOperation'><'span4'l><'span4'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "sPaginationType":"bootstrap",
            "oLanguage":{
                "sLengthMenu":"_MENU_ 条记录/页",
                "sSearch":"搜索:",
                "sInfo":"从_START_到_END_, 共有_TOTAL_条记录",
                "sInfoEmpty":"0条记录"
            },
            "bRetrieve":true,
            "bDestroy":true
        });
        $('div.bidSectionOperation').empty();
        $('div.bidSectionOperation').append(
                $('div.tableMenu').html()
        );
    }

    function reLoadIntentionOrgDataTable() {
        $('table#intentionOrgDataTable').dataTable({
            "sDom":"<'row-fluid'<'span4 intentionOrgOperation'><'span4'l><'span4'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "sPaginationType":"bootstrap",
            "oLanguage":{
                "sLengthMenu":"_MENU_ 条记录/页",
                "sSearch":"搜索:",
                "sInfo":"从_START_到_END_, 共有_TOTAL_条记录",
                "sInfoEmpty":"0条记录"
            },
            "bRetrieve":true,
            "bDestroy":true
        });
        $('div.intentionOrgOperation').empty();
        $('div.intentionOrgOperation').append(
                $('div.intentionOrgTableMenu').html()
        );
    }

    function showSpinner(visible){
        $('#spinner').style.display = visible ? "inline" : "none";
    }


</r:script>
</html>