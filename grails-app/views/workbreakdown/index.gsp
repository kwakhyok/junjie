<%@ page import="cn.com.agilemaster.Project; cn.com.agilemaster.TaskPlan; cn.com.agilemaster.Task; cn.com.agilemaster.Work; cn.com.agilemaster.Projectbreakdown; cn.com.agilemaster.Workbreakdown" %>
<<html>
<head>
<title>${meta(name: 'app.name')} -- WBS管理</title>
<meta content="main" name="layout"/>
<r:require module="acme"/>
<r:require module="j_primitive"/>
<r:require module="bootstrap_editable"/>

<style type="text/css">
table#myDataTable tr {
    cursor: pointer;
}

</style>


<r:script>
        var m_timer = null;

        var currentWbsId = $('#wbsMenu li:last a span.hidden').text();
        var currentPbsId = $('#pbsMenu li:last a span.hidden').text();

        function showTaskOrgChart(){
            console.log('begin to show the task org chart');
            $.getJSON('listTasksAsJson', {wbsId:currentWbsId}, function(data){
                ResizePlaceholder('#orgdiagram');
                GetWBSTask(data);
                $(window).resize(function(){
                    onWindowResize('#orgdiagram');
                });
            });
        }

        function showProjectOrgChart(){
            console.log('begin to show the project org chart');

            $.getJSON("listProjectsAsJson", {pbsCode:currentPbsId}, function (data) {
                    ResizePlaceholder('#pbsdiagram');
                    SetupPBSWidget(data);
                    $(window).resize(function () {
                        onWindowResize('#pbsdiagram');
                    });
                    event.preventDefault();
                });

        }

        $(function(){
             //showTaskOrgChart();
             var wbsTab = $('ul#myTab li#wbsChartTab');
             var pbsTab = $('ul#myTab li#pbsChartTab');
             var pbsDiagram = $('div#pbsdiagram');
             var wbsDiagram = $('div#orgdiagram');
             wbsTab.bind('click', function(event,data){
                //wbsDiagram.remove();
                showTaskOrgChart();
             });
             pbsTab.bind('click', function(event,data){
                //pbsDiagram.remove();
                showProjectOrgChart();
             });
        });

        function onWindowResize(diagramDiv) {
            if (m_timer == null) {
                m_timer = window.setTimeout(function () {
                    ResizePlaceholder();
                    jQuery(diagramDiv).orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh)
                    window.clearTimeout(m_timer);
                    m_timer = null;
                }, 300);
            }
        }




       var peopleImgs = ["${createLinkTo(dir: 'images/avatar', file: 'avatar1.jpeg')}",
        "${createLinkTo(dir: 'images/avatar', file: 'avatar2.jpeg')}",
        "${createLinkTo(dir: 'images/avatar', file: 'avatar3.jpeg')}",
        "${createLinkTo(dir: 'images/avatar', file: 'avatar4.jpeg')}",
        "${createLinkTo(dir: 'images/avatar', file: 'avatar5.jpeg')}",
        "${createLinkTo(dir: 'images/avatar', file: 'avatar8.jpeg')}",
        "${createLinkTo(dir: 'images/avatar', file: 'avatar7.jpeg')}"
        ];

        var taskImgs = ["${createLinkTo(dir: 'images/tasks', file: 'task1.jpg')}",
        "${createLinkTo(dir: 'images/tasks', file: 'task2.jpg')}",
        "${createLinkTo(dir: 'images/tasks', file: 'task3.jpg')}",
        "${createLinkTo(dir: 'images/tasks', file: 'task4.png')}"
        ];

        function getRandomOf(strings){
            return strings[Math.floor(Math.random() * strings.length)]
        }



        function GetWBSTask(data) {
            var options = new primitives.orgdiagram.Config();
            var rootItem = new primitives.orgdiagram.ItemConfig();
            rootItem.title = data.title;
            rootItem.description = data.description;
            rootItem.image = data.photo;
            var subTasks = data.subTasks;
            for (var index = 0; index < subTasks.length; index++) {
                var subItem = new primitives.orgdiagram.ItemConfig();
                subItem.code = subTasks[index].code;
                //console.log(subItem.code);
                subItem.title = subTasks[index].code + " " + subTasks[index].title;
                subItem.description = subTasks[index].description;
                subItem.image = getRandomOf(taskImgs);
                if (subTasks[index].hasOwnProperty('subTasks')) {
                    var subSubWorks = subTasks[index].subTasks;
                    for (var j = 0; j < subSubWorks.length; j++) {
                        //console.log(j + ": " + subSubWorks[j].code);
                        var subSubItem = new primitives.orgdiagram.ItemConfig();
                        subSubItem.code = subSubWorks[j].code;
                        subSubItem.title = subSubWorks[j].code + " " + subSubWorks[j].title;
                        subSubItem.description = subSubWorks[j].description;
                        subSubItem.image = getRandomOf(taskImgs);
                        if(subTasks[index].subTasks[j].hasOwnProperty('subTasks')){
                          var sssWorks = subTasks[index].subTasks[j].subTasks;
                          for(var k=0; k < sssWorks.length; k++){
                              var kItem = new primitives.orgdiagram.ItemConfig();
                              kItem.code = sssWorks[k].code;
                              kItem.title =sssWorks[k].code + " " + sssWorks[k].title;
                              kItem.description = sssWorks[k].description;
                              kItem.description = getRandomOf(taskImgs);
                              subSubItem.items.push(kItem);
                          }

                        }


                        subItem.items.push(subSubItem);
                    }
                    subItem.items.sort(function sortCode(a, b){
                    var al = a.code.split("\\.");
                    var bl = b.code.split("\\.");
                    if(al.length > 0){
                    var i=0;
                    while(i < al.length){
                        if(parseInt(al[i]) > parseInt(bl[i])) return 1;
                        if(parseInt(al[i]) < parseInt(bl[i])) return -1;
                        if(parseInt(al[i]) == parseInt(bl[i])){
                            i++;
                        }
                    }
                }
                    return 0;
                });
                }
                rootItem.items.push(subItem);
            }
            rootItem.items.sort(function sortCode(a, b){
           var al = a.code.split("\\.");
           var bl = b.code.split("\\.");
           if(al.length > 0){
            var i=0;
            while(i < al.length){
                if(parseInt(al[i]) > parseInt(bl[i])) return 1;
                if(parseInt(al[i]) < parseInt(bl[i])) return -1;
                if(parseInt(al[i]) == parseInt(bl[i])){
                     i++;
                }
            }
           }
           return 0;
       });
            options.rootItem = rootItem;
            options.cursorItem = rootItem;
            options.hasSelectorCheckbox = primitives.common.Enabled.False;
            options.orientationType = primitives.orgdiagram.OrientationType.Left;
            options.onMouseClick = onMouseClick;
            options.templates = [getCursorTemplate()];
            $("#orgdiagram").orgDiagram(options);

        }

       var sortMe = function(a, b){
           var al = a.code.split("\\.");
           var bl = b.code.split("\\.");
           if(al.length > 0){
            var i=0;
            while(i < al.length){
                if(parseInt(al[i]) > parseInt(bl[i])) return 1;
                if(parseInt(al[i]) < parseInt(bl[i])) return -1;
                if(parseInt(al[i]) == parseInt(bl[i])){
                     i++;
                }
            }
           }
           return 0;
       };




        function SetupPBSWidget(data) {
            var options = new primitives.orgdiagram.Config();
            var rootItem = new primitives.orgdiagram.ItemConfig();
            rootItem.title = data.name;
            rootItem.description = data.description;
            rootItem.image = getRandomOf(taskImgs);
            var subProjects = data.subProjects;
            for (var index = 0; index < subProjects.length; index++) {
                var subItem = new primitives.orgdiagram.ItemConfig();
                subItem.code = subProjects[index].code;
                subItem.title = subProjects[index].code + " " + subProjects[index].name;
                subItem.description = subProjects[index].description;
                subItem.image = getRandomOf(taskImgs);
                if (subProjects[index].hasOwnProperty('subProjects')) {
                    var subSubProjects = subProjects[index].subProjects;
                    for (var j = 0; j < subSubProjects.length; j++) {
                        var subSubItem = new primitives.orgdiagram.ItemConfig();
                        subSubItem.code = subSubProjects[j].code;
                        subSubItem.title = subSubProjects[j].code + " " + subSubProjects[j].name;
                        subSubItem.description = subSubProjects[j].description;
                        subSubItem.image = getRandomOf(taskImgs);
                        if(subSubProjects[j].hasOwnProperty('subProjects')){
                            var sssProjects = subSubProjects[j].subProjects;
                            for(var k=0; k< sssProjects.length; k++){
                                var sssItem = new primitives.orgdiagram.ItemConfig();
                                sssItem.code = sssProjects[k].code;
                                sssItem.title = sssProjects[k].code + " " + sssProjects[k].name;
                                sssItem.description = sssProjects[k].description;
                                sssItem.image = getRandomOf(taskImgs);
                                subSubItem.items.push(sssItem);
                            }
                        }

                        subItem.items.push(subSubItem);
                    }
                    subItem.items.sort(function sortCode(a, b){
                       var al = a.code.split("\\.");
                       var bl = b.code.split("\\.");
                        if(al.length > 0){
                            var i=0;
                            while(i < al.length){
                                if(parseInt(al[i]) > parseInt(bl[i])) return 1;
                                if(parseInt(al[i]) < parseInt(bl[i])) return -1;
                                if(parseInt(al[i]) == parseInt(bl[i])){
                               i++;
                               }
                            }
                        }
                        return 0;
                    });
                }
                rootItem.items.push(subItem);
            }
            rootItem.items.sort(function (a, b) {
                var codeA = a.code;
                var codeB = b.code;
                if (codeA > codeB) return 1;
                if (codeA < codeB) return -1;
            });
            options.rootItem = rootItem;
            options.cursorItem = rootItem;
            options.hasSelectorCheckbox = primitives.common.Enabled.False;
            $("#pbsdiagram").orgDiagram(options);
        }

        function ResizePlaceholder(diagramDiv) {
            /*       var bodyWidth = $(window).width() - 200
             var bodyHeight = $(window).height() - 200
             jQuery("#orgdiagram").css(
             {
             "width":bodyWidth + "px",
             "height":bodyHeight + "px"
             });*/
            //jQuery(diagramDiv).addClass('span11');
             var bodyWidth = $(window).width() - 240;
            var bodyHeight = $(window).height() - 20;
            jQuery(diagramDiv).css(
            {
                "width": bodyWidth + "px",
                "height": bodyHeight + "px"
            });
        }

        function getCursorTemplate(){
                     var result = new primitives.orgdiagram.TemplateConfig();
            result.name = "CursorTemplate";

            result.itemSize = new primitives.common.Size(120, 100);
            result.minimizedItemSize = new primitives.common.Size(3, 3);
            result.highlightPadding = new primitives.common.Thickness(2, 2, 2, 2);
            result.cursorPadding = new primitives.common.Thickness(3, 3, 50, 8);

            var cursorTemplate = jQuery("<div></div>")
            .css({
                position: "absolute",
                overflow: "hidden",
                width: (result.itemSize.width + result.cursorPadding.left + result.cursorPadding.right) + "px",
                height: (result.itemSize.height + result.cursorPadding.top + result.cursorPadding.bottom) + "px"
            });

            var cursorBorder = jQuery("<div></div>")
            .css({
                width: (result.itemSize.width + result.cursorPadding.left + 1) + "px",
                height: (result.itemSize.height + result.cursorPadding.top + 1) + "px"
            }).addClass("bp-item bp-corner-all bp-cursor-frame");
            cursorTemplate.append(cursorBorder);

            var bootStrapVerticalButtonsGroup = jQuery("<div></div>")
            .css({
                position: "absolute",
                overflow: "hidden",
                top: result.cursorPadding.top + "px",
                left: (result.itemSize.width + result.cursorPadding.left + 10) + "px",
                width: "35px",
                height: (result.itemSize.height + 1) + "px"
            }).addClass("btn-group btn-group-vertical");

            bootStrapVerticalButtonsGroup.append('<button class="btn btn-small" data-buttonname="info" type="button"><i class="icon-info-sign"></i></button>');
            bootStrapVerticalButtonsGroup.append('<button class="btn btn-small" data-buttonname="edit" type="button"><i class="icon-edit"></i></button>');
            bootStrapVerticalButtonsGroup.append('<button class="btn btn-small" data-buttonname="remove" type="button"><i class="icon-remove"></i></button>');
            bootStrapVerticalButtonsGroup.append('<button class="btn btn-small" data-buttonname="user" type="button"><i class="icon-user"></i></button>');

            cursorTemplate.append(bootStrapVerticalButtonsGroup);

            result.cursorTemplate = cursorTemplate.wrap('<div>').parent().html();

            return result;
        }

        function onMouseClick(event, data){
             var target = jQuery(event.originalEvent.target);
        if (target.hasClass("btn") || target.parent(".btn").length > 0)
        {
            var button = target.hasClass("btn") ? target : target.parent(".btn");
            var buttonname = button.data("buttonname");

            var message = "User clicked '" + buttonname + "' button for item '" + data.context.title + "'.";
            message += (data.parentItem != null ? " Parent item '" + data.parentItem.title + "'" : "");
            alert(message);

            data.cancel = true;
        }
        }

</r:script>
</head>

<body>
<%
    def currentUser = session.currentUser
    currentUser.refresh()
%>
<div class="row-fluid">

    <am:boxContainer icon="list" span="12" title="范围管理" canFold="false">
        <ul class="nav tab-menu nav-tabs" id="myTab">
            <li id="wbsChartTab" class="active"><a href="#wbsPane"><i class="fa-icon-sitemap"></i><span
                    class="break"></span>WBS</a></li>
            <li id="taskListTab"><a href="#taskListPanel"><i class="fa-icon-list"></i><span class="break"></span>滚动工作列表
            </a></li>
            <li id="pbsChartTab"><a href="#pbsPane"><i class="fa-icon-sitemap"></i><span class="break"></span>PBS</a>
            </li>
            <li id="projectListTab"><a href="#projectListPanel"><i class="fa-icon-list-alt"></i><span
                    class="break"></span>滚动项目列表</a></li>
        </ul>

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active" style="min-height: 600px" id="wbsPane">
                <div class="box-conent buttons hidden">
                    <div class="btn-group">
                        <button class="btn btn-large">选择WBS版本..</button>
                        <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span
                                class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" id="wbsMenu">
                            <g:each in="${Workbreakdown.list()}" var="wbs">
                                <li><a href="#"><i class="halflings-icon star"></i><span
                                        class="hidden">${wbs.code}</span><span>${wbs.title}</span></a>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div>

                <div id="orgdiagram"
                     style="min-height: 360px; position:relative; overflow:hidden; border-width:1px;">

                </div>
            </div>

            <div class="tab-pane" id="taskListPanel">
                <g:render template="taskList" model="[filteredTask: Task.list()]"/>
            </div>

            <div class="tab-pane" style="min-height: 600px" id="pbsPane">
                <div class="box-conent buttons hidden">
                    <div class="btn-group">
                        <button class="btn btn-large">选择PBS版本..</button>
                        <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" id="pbsMenu">
                            <g:each in="${Projectbreakdown.list()}" var="pbs">
                                <li><a href="#"><i
                                        class="halflings-icon star"></i><span
                                        class="hidden">${pbs.code}</span><span>${pbs.title}</span></a></li>
                            </g:each>
                        </ul>
                    </div>
                </div>


                <div id="pbsdiagram"
                     style="min-height: 360px; position:relative; overflow:hidden; border-width:1px;"></div>
            </div>

            <div class="tab-pane" id="projectListPanel">
                <g:render template="projectList" model="[filteredProjects: Project.list()]"/>
            </div>

        </div>
    </am:boxContainer>
</div>
<r:script>


    //  $('div#taskListPanel').siblings().removeClass('active');
    //  $('div#taskListPanel').addClass('active');
    function showSpinner(visible) {
        var spinner = $('#taskSpinner');
        if (visible) spinner.css("display", "inline");
        else spinner.css("display", "none");
    }



    function ReloadProjectDataTable() {

        $('table#projectDataTable').dataTable({
            "sDom":"<'row-fluid'<'span4 projectoperation'><'span4'l><'span4'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "sPaginationType":"bootstrap",
            "oLanguage":{
                "sLengthMenu":"_MENU_ 条记录/页",
                "sSearch":"搜索:",
                "sInfo":"从_START_到_END_, 共有_TOTAL_条记录",
                "sInfoEmpty":"0条记录"
            },
            "bRetrieve":true,
            "bDestroy":true
        });
        $('div.projectoperation').empty();

        $('div.projectoperation').append(
                $('div.projectTableMenu').html()
        );
    }


    function ReloadDataTable() {

        // $('ul#myTab li:first').next().trigger('click');

        $.fn.editable.defaults.mode = 'popup';
        $('.editable-assignedUser').editable({
            value:1,
            source:[
                {value:1, text:'郭奕'},
                {value:2, text:'成仔'}
            ]
        });
        $('.editable-participants').editable({
            value:2,
            source:[
                {value:1, text:'郭奕'},
                {value:2, text:'成仔'}
            ]
        });

        $('.editable-endDate').editable({
            datepicker:{
                weekStart:1
            }
        });

        $('table#myDataTable').dataTable({
            "sDom":"<'row-fluid'<'span4 taskoperation'><'span4'l><'span4'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "sPaginationType":"bootstrap",
            "oLanguage":{
                "sLengthMenu":"_MENU_ 条记录/页",
                "sSearch":"搜索:",
                "sInfo":"从_START_到_END_, 共有_TOTAL_条记录",
                "sInfoEmpty":"0条记录"
            },
            "bRetrieve":true,
            "bDestroy":true
        });
        $('div.taskoperation').empty();
        $('div.taskoperation').append(
                $('div.tableMenu').html()
        );
    }

    $(function () {
        var wbsPanel = $('div#wbsPane');
        var wbsDiagram = $('div#orgdiagram');
        if (wbsPanel.hasClass('active')) {
            showTaskOrgChart();
        } else {
            wbsDiagram.remove();
        }
        ReloadDataTable();
        $('#projectListTab').bind('click', function (event, data) {
            ReloadProjectDataTable();
        });

        $('#taskListTab').bind('click', function (event, data) {
            ReloadDataTable();
           // foldingTasks();
        });

        $('#wbsChartTab').bind('click', function (event, data) {
            showTaskOrgChart();
        });

        $('#pbsChartTab').bind('click', function (event, data) {
            showProjectOrgChart();
        });

    });


</r:script>
</body>
</html>