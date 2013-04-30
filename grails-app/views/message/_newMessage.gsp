<%@ page import="cn.com.agilemaster.User" %>
<am:boxContainer title="写信息" span="12" canFold="true" icon="edit">
    <form class="form-horizontal">
        <fieldset>
            <div class="control-group">
                <label class="control-label" for="messageTitle">题目</label>

                <div class="controls">
                    <input class="input-xxlarge focused" id="messageTitle" type="text" value="键入题目…">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="recipients">发送给...</label>

                <div class="controls">
                    <select id="recipients" multiple data-rel="chosen">
                        <g:each in="${User.list()}" var="user">
                            <option>${user}</option>
                        </g:each>
                    </select>
                </div>
            </div>

            <div class="control-group hidden-phone">
                <label class="control-label" for="messageBody">正文</label>

                <div class="controls">
                    <textarea class="cleditor" id="messageBody" rows="4"></textarea>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="fileInput">附件</label>

                <div class="controls">
                    <input class="input-file uniform_on" id="fileInput" type="file">
                </div>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">发送并保存</button>
                <button type="reset" class="btn">取消</button>
            </div>
        </fieldset>
    </form>
</am:boxContainer>