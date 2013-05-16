<%@ page import="cn.com.agilemaster.BidSection" %>

<%
    def bidSectionLabel = [drafted:'label-info',planned:'label-warning',processing:'label-important',completed: 'label-success']
    def bidSectionText  = [drafted:'立项',planned:'分配',processing:'执行',completed: '完成']
%>
<div class="tableMenu hidden">
    <ul class="nav nav-pills">

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">筛选标段..<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <g:each in="${BidSection.list().collect{it.bidCategory}.unique()}" var="category">
                    <li><g:remoteLink action="listBidSectionsByCat"
                                      params="[cat:category]"
                                      onLoading="showSpinner(true,'#bidSectionSpinner')"
                                      onComplete="showSpinner(false,'#bidSectionSpinner')"
                                      onSuccess="reLoadBidSectionDataTable()"
                                      update="[success:'bidSectionListPanel', error:'testDiv']">${category}</g:remoteLink> </li>
                </g:each>
            </ul>
        </li>
        <li><g:remoteLink action="planDemoBidSections" params="[wbsId: 'ROOT']"
                          update="[success: 'bidSectionListPanel']" onSuccess="reLoadBidSectionDataTable();">开始计划</g:remoteLink></li>
        <li class="disabled"><g:remoteLink action="ajaxImportBidSections"
                          update="[success: 'bidSectionListPanel']"
                          onSuccess="reLoadBidSectionDataTable();">导入标段</g:remoteLink></li>
        <li><g:remoteLink action="planDemoBidSections"
                          params="[wbsId: 'ROOT']" update="[success: 'bidSectionListPanel']"
                          onSuccess="reLoadBidSectionDataTable();">恢复初始</g:remoteLink></li>
    </ul>
</div>
<img id="bidSectionSpinner" src="${createLinkTo(dir:'images', file:'spinner.gif')}" style="display: none" alt=""/>
<table class="table table-bordered" id="bidSectionDataTable">
    <thead>
    <th>编号</th>
    <th>名称</th>
    <th>子标段数量</th>
    <th>开标时间</th>
    <th>负责人</th>
    <th>参与人</th>
    <th>截止时间</th>
    </thead>
    <tbody>
    <g:each in="${filteredBidSections}" var="bidSection">
        <tr>

            <td >${bidSection.code}</td>
            <td><span class="label ${bidSectionLabel[bidSection.status]}">${bidSectionText[bidSection.status]}</span>  ${bidSection.title}</td>
            <td>${bidSection.project?.name}</td>
            <td><am:dateFromNow date="${bidSection.dateCreated}"/></td>
            <td>
                <a class="editable-assignedUser" href="#"
                   data-type="select" data-pk="${bidSection.id}" data-original-title='负责人...'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateBidSectionAssignedUser')}">
                    ${bidSection.currentPlan ? bidSection.currentPlan?.assignedUser : 负责人}
                </a>

            </td>

            <td>
                <a class="editable-participants" href="#"
                   data-type="select" data-pk="${bidSection.id}" data-original-title='分配...'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateBidSectionParticipants')}">
                    ${bidSection.currentPlan ? bidSection.currentPlan?.participants.collect{it.username}.join(',') : 负责人}
                </a>
            </td>

            <td>
                <a class="editable-endDate" href="#"
                   data-type="date" data-pk="${bidSection.id}" data-format="yyyy-mm-dd" data-original-title='请分配'
                   data-url="${createLink(controller: 'workbreakdown', action: 'updateBidSectionEndDate')}">
                    <g:if test="${bidSection.currentPlan}">
                        <am:dateFromNow date="${bidSection.currentPlan.endDate}"/>
                    </g:if>
                    <g:else>
                        截止日期
                    </g:else>
                </a>
            </td>

        </tr>
    </g:each>
    </tbody>
</table>
