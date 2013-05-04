<!DOCTYPE html>
<%@ page import="cn.com.agilemaster.User" contentType="text/html;charset=UTF-8" %>
<html lang="">
<head>
    <title>${meta(name: 'app.name')} -- 沟通管理</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
</head>

<body>
<div class="row-fluid">
    <am:boxContainer title="写信息" span="12" canFold="true" icon="edit">
        <g:uploadForm action="sendAndSave">
            <fieldset>
                <div class="control-group">
                    %{-- <label class="control-label" for="messageTitle">题目</label>--}%
                    <div class="controls">
                        <input class="input-xxlarge focused" id="messageTitle" type="text" value="键入发文题目…" name="title">
                    </div>
                </div>

                <div class="control-group">
                    %{--<label class="control-label" for="recipients">发送给...</label>--}%
                    <div class="controls">
                        <select id="recipients" class="input-xxlarge" multiple data-rel="chosen"
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
                        <select id="tags" class="input-xxlarge" multiple data-rel="chosen"
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
                        <textarea class="cleditor" id="messageBody" name="body" rows="4"></textarea>
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
    </am:boxContainer>
</div>
</body>

</html>