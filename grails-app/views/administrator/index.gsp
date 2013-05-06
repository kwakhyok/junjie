<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${meta(name: 'app.name')} -- 系统后台操作</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
    <r:require module="datatable_tabletools"/>
</head>

<body>
<div class="row-fluid hide">

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

<div class="box-header">
    <h2><i class="halflings-icon th"></i><span class="break"></span>用户管理</h2>
</div>
<div class="box-content">
    <ul class="nav tab-menu nav-tabs" id="myTab">
        <li class="active"><a href="#usersPanel">普通用户</a></li>
        <li><a href="#rolesPanel">所有角色</a></li>
        <li><a href="#groupsPanel">所有群组</a></li>
        <li><a href="#adminsPanel">所有管理员</a></li>
    </ul>

    <div id="myTabContent" class="tab-content">
        <div class="tab-pane active" id="usersPanel">
            UsersPanel


            <%@ page import="cn.com.agilemaster.User" %>
            <g:set var="userInstanceList" value="${User.list()}"/>

           <table class="table myDatatable">
            <thead>
            <tr>
                <th>1</th>
                <th>1</th>
                <th>1</th>
                <th>1</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>2</td>
                <td>2</td>
                <td>2</td>
                <td>2</td>
            </tr>
            </tbody>
           </table>





        </div>
        <div class="tab-pane" id="rolesPanel">
            RolesPanel
        </div>
        <div class="tab-pane" id="groupsPanel">
            GroupsPanel
        </div>
        <div class="tab-pane" id="adminsPanel">
            AdminsPanel
        </div>

    </div>

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
            <g:uploadForm id="wbsForm" action="importWBS">
                <div class="control-group">
                    <label class="control-label" for="inputExcel3">WBS文件路径</label>

                    <div class="controls">
                        %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                        <input type="file" id="inputExcel4" name="wbsFile">
                        <span class="help-inline"></span>
                        <g:submitButton class="btn btn-danger" name="importWBS" value="导入"/>
                    </div>
                    <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/wbs.xlsx</blockquote>
                </div>
            </g:uploadForm>


            <g:uploadForm id="pbsForm" action="importPBS">
                <div class="control-group">
                    <label class="control-label" for="inputExcel4">PBS文件路径</label>

                    <div class="controls">
                        %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                        <input type="file" id="inputExcel4" name="pbsFile">
                        <span class="help-inline"></span>
                        <g:submitButton class="btn btn-danger" name="importPBS" value="导入"/>
                    </div>
                    <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/pbs.xlsx</blockquote>
                </div>
            </g:uploadForm>
            <g:uploadForm id="orgForm" action="importOrgs">
                <div class="control-group">
                    <label class="control-label" for="inputExcel1">企业登记Excel</label>

                    <div class="controls">
                        %{--<input type="text" id="inputExcel1" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx">--}%
                        <input type="file" id="inputExcel1" name="orgFile" class="input-xxlarge"/>
                        <span class="help-inline"></span>
                        <g:submitButton name="importOrgs" value="导入" class="btn btn-danger"/>
                    </div>
                </div>
                <blockquote>e.g.: /Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx</blockquote>
            </g:uploadForm>

            <g:uploadForm id="designCategoryForm" action="importDesignCategories">
                <div class="control-group">
                    <label class="control-label" for="inputExcel3">资料文路径</label>

                    <div class="controls">
                        %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                        <input type="file" id="inputExcel3" name="categoryFile">
                        <span class="help-inline"></span>
                        <g:submitButton class="btn btn-danger" name="importDesignCategories" value="导入"/>
                    </div>
                    <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx</blockquote>
                </div>
            </g:uploadForm>





            <g:uploadForm id="specialistForm" action="importSpecialist">
                <div class="control-group">
                    <label class="control-label" for="inputExcel5">专家库文档</label>

                    <div class="controls">
                        %{--<input type="text" id="inputExcel3" name="filePath" class="input-xxlarge" value="/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx">--}%
                        <input type="file" id="inputExcel5" name="specialistFile">
                        <span class="help-inline"></span>
                        <g:submitButton class="btn btn-danger" name="importSpecialist" value="导入"/>
                    </div>
                    <blockquote>/Users/guo/Documents/Development/AgileMaster滨州医学院文档/工程/专家库名单.xlsx</blockquote>
                </div>
            </g:uploadForm>

        </div>
    </div>

</div>

<div class="row-fluid">

</div>
<r:script>
$(document).ready(function(){

 /*   $('table.myDatatable').dataTable({
        "sDom":"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6 pull-right'p>>",
        "sPaginationType":"bootstrap",
        "oLanguage":{
            "sLengthMenu":"_MENU_ 条记录/页",
            "sSearch":"搜索:",
            "sInfo":"从_START_到_END_, 共有_TOTAL_条记录",
            "sInfoEmpty":"0条记录"
        }
    });*/

    $('table.myDatatable').dataTable({
        "sDom":"<'row-fluid'<'span6'T><'span6'f>r>t",
        "sPaginationType":"bootstrap",
        "oLanguage":{
            "sLengthMenu":"_MENU_ 条记录/页",
            "sSearch":"搜索:",
            "sInfo":"从_START_到_END_, 共有_TOTAL_条记录",
            "sInfoEmpty":"0条记录"
        },
        "oTableTools":{
            "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
            "aButtons":[
                "copy",
                "print",
                {
                    "sExtends":"collection",
                    "sButtonText":'保存为<span class="caret"/>',
                    "aButtons":["csv", "xls", "pdf"]
                }
            ]
        },
        "bRetrieve":true,
        "bDestroy":true
    });
});

// Set the classes that TableTools uses to something suitable for Bootstrap
$.extend( true, $.fn.DataTable.TableTools.classes, {
    "container": "btn-group",
    "buttons": {
        "normal": "btn",
        "disabled": "btn disabled"
    },
    "collection": {
        "container": "DTTT_dropdown dropdown-menu",
        "buttons": {
            "normal": "",
            "disabled": "disabled"
        }
    }
} );

// Have the collection use a bootstrap compatible dropdown
$.extend( true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
    "collection": {
        "container": "ul",
        "button": "li",
        "liner": "a"
    }
} );

</r:script>
</body>
</html>