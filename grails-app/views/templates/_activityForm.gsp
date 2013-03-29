<div class="modal hide fade" id="activityForm">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">x</button>

        <h3 id="taskTitle">task.title</h3>
    </div>

    <div class="modal-body">
        <form class="form-horizontal">
            <fieldset>
                <div class="control-group">
                    <label class="control-label" for="startDate">开始时间</label>

                    <div class="controls">
                        <bs:datePicker id="startDate" name="startDate" precision="day"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="endDate">结束时间</label>

                    <div class="controls">
                        <bs:datePicker id="endDate" name="endDate" precision="day"/>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>

    <div class="modal-footer">
        <a class="btn" data-dismiss="modal">取消</a>
        <g:link class="btn btn-primary" controller="task" action="saveActivity" params="[taskId: '1']">保存</g:link>
    </div>
</div>