<g:if test="${session.layout == null || session.layout == 'grid'}">
    <g:set var="menutype" value="nav nav-tabs" />
</g:if>
<g:elseif test="${session.layout == 'fluid'}">
    <g:set var="menutype" value="nav nav-tabs" />
</g:elseif>

<!-- position of menu: LTR (left-to-right, European) or RTL (right-to-left, Oriental) -->
<g:if test="${session.menuposition == 'right' && session.layout == 'grid'}">
    <g:set var="menuposition" value="pull-right" />
</g:if>
<g:elseif test="${session.menuposition == 'right' && session.layout == 'fluid'}">
    <g:set var="menuposition" value="tabbable tabs-right" /> <!-- pull-right -->
</g:elseif>
<g:elseif test="${session.layout == 'fluid'}">
    <g:set var="menuposition" value="tabbable tabs-left" /> <!-- pull-left -->
</g:elseif>
<g:else>
    <g:set var="menuposition" value="" />
</g:else>

<div class="${menuposition}">
    <ul class="${menutype}" data-role="listview" data-split-icon="gear" data-filter="true">

        <li class="controller${params.controller == 'information' ? " active" : ""}">
            <g:link controller="information" action="index">
                <g:message code="junjie.menus.information"/>
            </g:link>
        </li>


        <li class="controller${params.controller == 'purchase' ? " active" : ""}">
            <g:link controller="purchase" action="index">
                <g:message code="junjie.menus.purchase"/>
            </g:link>
        </li>


        <li class="controller${params.controller == 'contract' ? " active" : ""}">
            <g:link controller="contract" action="index">
                <g:message code="junjie.menus.contacts"/>
            </g:link>
        </li>

        <li class="controller${params.controller == 'investment' ? " active" : ""}">
            <g:link controller="investment" action="index">
                <g:message code="junjie.menus.investment"/>
            </g:link>
        </li>

        <li class="controller${params.controller == 'design' ? " active" : ""}">
            <g:link controller="design" action="index">
                <g:message code="junjie.menus.design"/>
            </g:link>
        </li>

        <li class="controller${params.controller == 'project' ? " active" : ""}">
            <g:link controller="project" action="index">
                <g:message code="junjie.menus.process"/>
            </g:link>
        </li>

        <li class="controller${params.controller == 'profile' ? " active" : ""}">
            <g:link controller="profile" action="index">
                <g:message code="junjie.menus.profile"/>
            </g:link>
        </li>
        <li class="controller${params.controller == 'activity' ? " active" : ""}">
            <g:link controller="activity" action="index">
                <g:message code="junjie.menus.activity"/>
            </g:link>
        </li>

        <li class="controller${params.controller=='administrator'? "active": ""}">
            <g:link controller="administrator" action="index">
                <g:message code="junjie.menus.administration"/>
            </g:link>
        </li>

    </ul>
</div>


