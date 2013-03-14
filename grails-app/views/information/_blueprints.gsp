<g:set var="entityName" value="${message(code: 'blueprints.label', default: 'Blueprint')}"/>

<section id="list-blueprint" class="first">
   <h2></h2>
    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="category" title="${message(code: 'blueprint.category.label', default: 'Category')}"/>

            <g:sortableColumn property="name"
                              title="${message(code: 'blueprint.name.label', default: 'Name')}"/>

            <g:sortableColumn property="contact"
                              title="${message(code: 'blueprint.organization.label', default: 'Organization')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${superVisionList}" status="i" var="superVisionInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${superVisionInstance.id}">${fieldValue(bean: superVisionInstance, field: "name")}</g:link></td>
                <td>${fieldValue(bean: superVisionInstance, field: "address")}</td>
                <td>${fieldValue(bean: superVisionInstance, field: "contact")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${organizationInstanceTotal}"/>
    </div>
</section>
