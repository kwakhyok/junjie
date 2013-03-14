<section id="list-user" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>
            <g:sortableColumn property="authority" title="authority"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${roleInstanceList}" status="i" var="roleInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${roleInstance.authority}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

</section>