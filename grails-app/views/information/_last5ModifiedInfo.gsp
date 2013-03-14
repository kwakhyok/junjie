<g:set var="last5TitleName" value="${message(code: 'default.last5TitleName', default: 'last5TitleName')}" />
<h3>"[last5TitleName]"</h3>
<h2>fefefe</h2>

<section id="list-_info" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: '_DemoPage.name.label', default: 'Name')}" />

            <g:sortableColumn property="myDate" title="${message(code: '_DemoPage.myDate.label', default: 'My Date')}" />

            <g:sortableColumn property="myBoolean" title="${message(code: '_DemoPage.myBoolean.label', default: 'My Boolean')}" />

            <g:sortableColumn property="myInt" title="${message(code: '_DemoPage.myInt.label', default: 'My Int')}" />

            <g:sortableColumn property="myShort" title="${message(code: '_DemoPage.myShort.label', default: 'My Short')}" />

            <g:sortableColumn property="myLong" title="${message(code: '_DemoPage.myLong.label', default: 'My Long')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${OrganizationList}" status="i" var="_DemoPageInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${_DemoPageInstance.id}">${fieldValue(bean: _DemoPageInstance, field: "name")}</g:link></td>

                <td><g:formatDate date="${_DemoPageInstance.myDate}" /></td>

                <td><g:formatBoolean boolean="${_DemoPageInstance.myBoolean}" /></td>

                <td>${fieldValue(bean: _DemoPageInstance, field: "myInt")}</td>

                <td>${fieldValue(bean: _DemoPageInstance, field: "myShort")}</td>

                <td>${fieldValue(bean: _DemoPageInstance, field: "myLong")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <bs:paginate total="${_DemoPageInstanceTotal}" />
    </div>
</section>
