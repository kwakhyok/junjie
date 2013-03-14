<%@ page import="cn.com.agilemaster.Task" %>



			<div class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'title', 'error')} ">
				<label for="title" class="control-label"><g:message code="task.title.label" default="Title" /></label>
				<div class="controls">
					<g:textField name="title" maxlength="10" value="${taskInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: taskInstance, field: 'title', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="task.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${taskInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: taskInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'endDate', 'error')} required">
				<label for="endDate" class="control-label"><g:message code="task.endDate.label" default="End Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="endDate" precision="day"  value="${taskInstance?.endDate}"  />
					<span class="help-inline">${hasErrors(bean: taskInstance, field: 'endDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'project', 'error')} required">
				<label for="project" class="control-label"><g:message code="task.project.label" default="Project" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="project" name="project.id" from="${cn.com.agilemaster.Project.list()}" optionKey="id" required="" value="${taskInstance?.project?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: taskInstance, field: 'project', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'startDate', 'error')} required">
				<label for="startDate" class="control-label"><g:message code="task.startDate.label" default="Start Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="startDate" precision="day"  value="${taskInstance?.startDate}"  />
					<span class="help-inline">${hasErrors(bean: taskInstance, field: 'startDate', 'error')}</span>
				</div>
			</div>

