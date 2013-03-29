<div class="modal hide" id="ActivityModal">
    <section id="create-activity" class="first">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">x</button>

            <h3>Title</h3>
            <g:hasErrors bean="${activityInstance}">
                <div class="alert alert-error">
                    <g:renderErrors bean="${activityInstance}" as="list"/>
                </div>
            </g:hasErrors>
        </div>

        <div class="modal-body">

            <g:form controller="activity" action="createActivity" class="form-horizontal">
                <fieldset class="form">
                    <g:render template="/activity/form" model="[organization:organization]"/>
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