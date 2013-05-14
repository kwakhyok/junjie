<div class="box span12" onTablet="span12" onDesktop="span12">
    <div class="box-content">

        <div class="btn-toolbar">
            <div class="btn-group">
                <g:remoteLink class="btn btn-info btn-xlarge"
                              controller='backend' action='ajaxImportLocalWBS'
                              onmousedown="clearMessage(e)"
                              onLoading="showSpinner(true)"
                              onComplete="showSpinner(false)"
                              update="message">从默认配置中导入WBS工作分解</g:remoteLink>
                <g:remoteLink class="btn btn-info btn-xlarge"
                              controller='backend' action='ajaxImportLocalWBS'>从默认配置中导入PBS项目分解</g:remoteLink>
                <g:remoteLink class="btn btn-info btn-xlarge"
                              controller='backend' action='ajaxImportLocalBidSection'>从默认配置中导入标段划分</g:remoteLink>
                <g:remoteLink class="btn btn-info btn-xlarge"
                              controller='backend' action='importFromLocalDefaultFile'>从默认配置中导入干系企业名录</g:remoteLink>
            </div>
        </div>
        <img id="spinner" style="display: none" src="${createLinkTo(dir:'images', file:'spinner.gif')}"/>

        <div class="message"></div>


        <g:uploadForm id="wbsForm" controller="administrator" action="importWBS">
            <div class="control-group">
                <label class="control-label" for="inputExcel3">WBS文件路径</label>

                <div class="controls">
                    <input type="file" id="inputExcel4" name="wbsFile">
                    <span class="help-inline"></span>
                    <g:submitButton class="btn btn-primary" name="importWBS" value="导入"/>
                </div>
                <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/wbs.xlsx</blockquote>
            </div>
        </g:uploadForm>
        <g:uploadForm id="pbsForm" controller="administrator" action="importPBS">
            <div class="control-group">
                <label class="control-label" for="inputExcel4">PBS文件路径</label>

                <div class="controls">
                    %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                    <input type="file" id="inputExcel4" name="pbsFile">
                    <span class="help-inline"></span>
                    <g:submitButton class="btn btn-primary" name="importPBS" value="导入"/>
                </div>
                <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/pbs.xlsx</blockquote>
            </div>
        </g:uploadForm>
        <g:uploadForm id="orgForm" controller="administrator" action="importOrgs">
            <div class="control-group">
                <label class="control-label" for="inputExcel1">企业登记Excel</label>

                <div class="controls">
                    %{--<input type="text" id="inputExcel1" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx">--}%
                    <input type="file" id="inputExcel1" name="orgFile" class="input-xxlarge"/>
                    <span class="help-inline"></span>
                    <g:submitButton name="importOrgs" value="导入" class="btn btn-primary"/>
                </div>
            </div>
            <blockquote>e.g.: /Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx</blockquote>
        </g:uploadForm>
        <g:uploadForm id="designCategoryForm" controller="administrator" action="importDesignCategories">
            <div class="control-group">
                <label class="control-label" for="inputExcel3">资料文路径</label>

                <div class="controls">
                    %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                    <input type="file" id="inputExcel3" name="categoryFile">
                    <span class="help-inline"></span>
                    <g:submitButton class="btn btn-primary" name="importDesignCategories" value="导入"/>
                </div>
                <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx</blockquote>
            </div>
        </g:uploadForm>
        <g:uploadForm id="specialistForm" controller="administrator" action="importSpecialist">
            <div class="control-group">
                <label class="control-label" for="inputExcel5">专家库文档</label>

                <div class="controls">
                    %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                    <input type="file" id="inputExcel5" name="specialistFile">
                    <span class="help-inline"></span>
                    <g:submitButton class="btn btn-primary" name="importSpecialist" value="导入"/>
                </div>
                <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/工程/专家库名单.xlsx</blockquote>
            </div>
        </g:uploadForm>

    </div>
</div>