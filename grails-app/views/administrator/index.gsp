<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 系统后台操作</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
</head>

<body>
<div class="row-fluid">

    <a class="quick-button span2">
        <i class="fa-icon-group"></i>
        <p>沟通</p>
        <span class="notification">1.367</span>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-comments-alt"></i>
        <p>监理</p>
        <span class="notification green">167</span>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-shopping-cart"></i>
        <p>采购</p>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-barcode"></i>
        <p>投资</p>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-envelope"></i>
        <p>信息</p>
    </a>
    <a class="quick-button span2">
        <i class="fa-icon-calendar"></i>
        <p>任务计划</p>
        <span class="notification red">68</span>
    </a>
    <div class="clearfix"></div>
</div>

<div class="row-fluid">
    <div class="box span6" onTablet="span6" onDesktop="span6">
        <div class="box-header">
            <h2><i class="halflings-icon list"></i><span class="break"></span>项目基本信息设置</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>
        <div class="box-content">

        </div>
    </div>

    <div class="box span6" onTablet="span6" onDesktop="span6">
        <div class="box-header">
            <h2><i class="halflings-icon list"></i><span class="break"></span>数据库监控</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>
        <div class="box-content">

        </div>
    </div>

</div>



<div class="row-fluid">
    <div class="box span6" onTablet="span6" onDesktop="span6">
        <div class="box-header">
            <h2><i class="halflings-icon list"></i><span class="break"></span>系统设置</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>
        <div class="box-content">

        </div>
    </div>

    <div class="box span6" onTablet="span6" onDesktop="span6">
        <div class="box-header">
            <h2><i class="halflings-icon list"></i><span class="break"></span>生成Demo数据</h2>
            <div class="box-icon">
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <g:uploadForm id="orgForm" action="importOrgs">
                <div class="control-group">
                    <label class="control-label" for="inputExcel1">企业登记Excel</label>
                    <div class="controls">
                        %{--<input type="text" id="inputExcel1" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx">--}%
                        <input type="file" id="inputExcel1" name="orgFile" class="input-xxlarge" />
                        <span class="help-inline"></span>
                        <g:submitButton name="importOrgs" value="导入" class="btn btn-danger" />
                    </div>
                </div>
                <blockquote>e.g.: /Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx</blockquote>
            </g:uploadForm>

            <g:uploadForm id="projectForm" action="importProjects">
                <div class="control-group">
                    <label class="control-label" for="inputExcel2">项目信息Excel</label>
                    <div class="controls">
                        %{--<input type="text" id="inputExcel2" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx">--}%
                        <input type="file" id="inputExcel2" name="projectFile">
                        <span class="help-inline"></span>
                        <g:submitButton class="btn btn-danger" name="importProjects" value="导入"/>
                    </div>
                    <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx</blockquote>
                </div>
                <span></span>
            </g:uploadForm>

           <g:uploadForm id="designCategoryForm" action="importDesignCategories">
               <div class="control-group">
                   <label class="control-label" for="inputExcel3">资料文路径</label>
                   <div class="controls">
                       %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                       <input type="file" id="inputExcel3" name="categoryFile">
                       <span class="help-inline"></span>
                       <g:submitButton class="btn btn-danger" name="importDesignCategories" value="导入" />
                   </div>
                   <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx</blockquote>
               </div>
           </g:uploadForm>
        </div>
    </div>

</div>

</body>
</html>