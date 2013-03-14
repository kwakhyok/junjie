<div class="modal hide" id="UserModal">
    <section id="create-user" class="first">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">x</button>

            <h3><g:message code="junjie.user"/></h3>
            <g:hasErrors bean="${userInstance}">
                <div class="alert alert-error">
                    <g:renderErrors bean="${userInstance}" as="list"/>
                </div>
            </g:hasErrors>
        </div>

        <div class="modal-body">

            <g:form action="createOrUpdateUser" class="form-horizontal">
                <fieldset class="form">
                    <!-- g:render template="/activity/form" model="[organization:organization]" -->
                    <h1> User Form </h1>
                </fieldset>

                <div class="form-actions">
                    <g:submitButton name="create" class="btn btn-primary"
                                    value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    <button class="btn" type="reset">Cancel</button>
                </div>
            </g:form>
        </div>

    </section>
</div>