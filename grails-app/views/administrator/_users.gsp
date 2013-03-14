<section id="list-user" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="username" title="username"/>

            <g:sortableColumn property="fullname" title="name"/>

            <g:sortableColumn property="email" title="email"/>

            <g:sortableColumn property="position" title="position"/>

            <g:sortableColumn property="telephone" title="telephone"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" status="i" var="userInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                <td>${userInstance.profile?.lastName}${userInstance.profile?.firstName}</td>

                <td>${userInstance.profile?.email}</td>

                <td>${userInstance.profile?.position}</td>

                <td>${userInstance.profile?.telephone}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${userInstanceTotal}"/>
    </div>
</section>