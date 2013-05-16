<%@ page import="cn.com.agilemaster.User" %>

<div class="box-header">
    <h2><i class="halflings-icon th"></i><span class="break">发信息|回信息|转信息</span></h2>
</div>

<div class="box-content">
    <g:uploadForm action="sendAndSave">
        <fieldset>
            <div class="control-group">
                %{-- <label class="control-label" for="messageTitle">题目</label>--}%
                <div class="controls">
                    <input class="input-xlarge focused" id="messageTitle" type="text" value="键入发文题目…" name="title">
                </div>
            </div>

            <div class="control-group">
                %{--<label class="control-label" for="recipients">发送给...</label>--}%
                <div class="controls">
                    <select id="recipients" class="input-xlarge" multiple data-rel="chosen"
                            data-placeholder="请选择收件人..." name="recipients">
                        <g:each in="${User.list()}" var="user">
                            <option>${user}</option>
                        </g:each>
                    </select>
                </div>
            </div>


            <div class="control-group">
                %{--<label class="control-label" for="recipients">发送给...</label>--}%
                <div class="controls">
                    <select id="tags" class="input-xlarge" multiple data-rel="chosen"
                            data-placeholder="请选择标签..." name="tags">
                        <g:each in="${cn.com.agilemaster.MessageTag.list()}" var="tag">
                            <option>${tag}</option>
                        </g:each>
                    </select>
                </div>
            </div>

            <div class="control-group hidden-phone">
                %{--<label class="control-label" for="messageBody">正文</label>--}%

                <div class="controls">
                    <g:textArea class="cleditor input-xxlarge" id="messageBody" name="body"
                                rows="4" cols="1"></g:textArea>
                </div>
            </div>

            <div class="control-group">
                %{--<label class="control-label" for="fileInput">附件</label>--}%

                <div class="controls">
                    <input class="input-file uniform_on" id="uploadFile" type="file" name="uploadedFile">
                </div>
            </div>

            <div class="form-actions">
                <g:actionSubmit action="sendAndSave" value="发送并保存" class="btn btn-primary"/>
                <button type="reset" class="btn">取消</button>
            </div>
        </fieldset>
    </g:uploadForm>
</div>