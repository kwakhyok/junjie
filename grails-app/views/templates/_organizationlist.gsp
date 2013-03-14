

<section id="list-organization" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'organization.name.label', default: 'Name')}"/>

            <g:sortableColumn property="address"
                              title="${message(code: 'organization.address.label', default: 'Address')}"/>

            <g:sortableColumn property="contact"
                              title="${message(code: 'organization.contact.label', default: 'Contact')}"/>


            <th>operation</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${organizationList}" status="i" var="organizationInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${organizationInstance.id}">${fieldValue(bean: organizationInstance, field: "name")}</g:link></td>
                <td>${fieldValue(bean: organizationInstance, field: "address")}</td>
                <td>${fieldValue(bean: organizationInstance, field: "contact")}</td>
                <td><g:link action="delete" id="${organizationInstance.id}">delete</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${organizationTotal}"/>
    </div>
</section>