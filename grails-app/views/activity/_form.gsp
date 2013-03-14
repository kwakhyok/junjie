<%@ page import="cn.com.agilemaster.Activity" %>



<div class="control-group fieldcontain ${hasErrors(bean: activityInstance, field: 'tag', 'error')} required">
    <label for="tag" class="control-label"><g:message code="activity.tag.label" default="Tag"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select name="tag" from="${Activity.constraints.tag.inList}"
                  keys="${Activity.constraints.tag.inList}" required=""
                  value="${activityInstance?.tag}"/>
        <span class="help-inline">${hasErrors(bean: activityInstance, field: 'tag', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: activityInstance, field: 'description', 'error')} ">
    <label for="description" class="control-label"><g:message code="activity.description.label"
                                                              default="Description"/></label>

    <div class="controls">
        <g:textField name="description" maxlength="100" value="${activityInstance?.description}"/>
        <span class="help-inline">${hasErrors(bean: activityInstance, field: 'description', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: activityInstance, field: 'organization', 'error')} required">
    <label for="organization" class="control-label"><g:message code="activity.organization.label"
                                                               default="Organization"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="organization" name="organization.id" from="${cn.com.agilemaster.Organization.list()}"
                  optionKey="id" required="" value="${activityInstance?.organization?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: activityInstance, field: 'organization', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: activityInstance, field: 'task', 'error')} required">
    <label for="task" class="control-label"><g:message code="activity.task.label" default="Task"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="task" name="task.id" from="${cn.com.agilemaster.Task.list()}" optionKey="id" required=""
                  value="${activityInstance?.task?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: activityInstance, field: 'task', 'error')}</span>
    </div>
</div>

