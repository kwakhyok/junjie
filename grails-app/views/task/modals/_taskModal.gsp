<%@ page import="cn.com.agilemaster.User" %>
%{--this is the modal for plannning task--}%
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">x</button>

    <h3 id="taskTitle">${task.title}</h3>
</div>

<div class="modal-body">
    <form class="form-horizontal">
        <fieldset>
            <div class="control-group">
                <label class="control-label" for="startDate">开始时间</label>

                <div class="controls">
                    %{--<bs:datePicker id="startDate" name="startDate" precision="day"/>--}%
                    <input type="text" class="input-xlarge datepicker" id="startDate" name="startDate"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="endDate">结束时间</label>

                <div class="controls">
                    <bs:datePicker id="endDate" name="endDate" precision="day"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="endDate">负责人</label>

                <div class="controls">
                    <g:select name="assignedUserProfile"
                              noSelection="${['null': '请选择...']}" from="${User.list()*.profile}"
                              optionKey="id"
                              value="lastName+firstName"/>
                </div>
            </div>
            %{--TODO: datepicker does not work along with modal in bootstrap.--}%
        </fieldset>
    </form>

</div>

<div class="modal-footer">
    <a class="btn" data-dismiss="modal">取消</a>
    <g:link class="btn btn-primary" controller="task" action="planTaskSave" params="[taskId: '1']">保存</g:link>
</div>
