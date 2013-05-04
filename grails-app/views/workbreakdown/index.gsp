<%@ page import="cn.com.agilemaster.Task; cn.com.agilemaster.Work; cn.com.agilemaster.Projectbreakdown; cn.com.agilemaster.Workbreakdown" %>
<<html>
<head>
    <title>${meta(name: 'app.name')} -- WBS管理</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
    <r:require module="j_primitive"/>
    <r:script>
        var m_timer = null;

        jQuery(document).ready(function () {
            /*  == .live(), but in jquery 1.8 there's more preformant way! */
            $(document).delegate('#wbsMenu li a', 'click', function (event, data) {
                // console.log('this: ' + $(this).children('span.hidden').text() + ' type: ' + event.type);
                var myWbsId = $(this).children('span.hidden').text();
                $.getJSON("listWorksAsJson", {wbsId:myWbsId}, function (data) {
                    ResizePlaceholder('#orgdiagram');
                    SetupWBSWidget(data);
                    $(window).resize(function () {
                        onWindowResize('#orgdiagram');
                    });

                    event.preventDefault();
                });
            });


            $(document).delegate('#pbsMenu li a', 'click', function (event, data) {
                var myPbsCode = $(this).children('span.hidden').text();
                $.getJSON("listProjectsAsJson", {pbsCode:myPbsCode}, function (data) {
                    ResizePlaceholder('#pbsdiagram');
                    SetupPBSWidget(data);
                    $(window).resize(function () {
                        onWindowResize('#pbsdiagram');
                    });
                    event.preventDefault();
                });
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

        function SetupWBSWidget(data) {
            var options = new primitives.orgdiagram.Config();
            var rootItem = new primitives.orgdiagram.ItemConfig();
            rootItem.title = data.title;
            rootItem.description = data.description;
            rootItem.image = "http://www.basicprimitives.com/demo/images/photos/a.png";
            var subWorks = data.subWorks;
            for (var index = 0; index < subWorks.length; index++) {
                var subItem = new primitives.orgdiagram.ItemConfig();
                subItem.code = subWorks[index].code;
                //console.log(subItem.code);
                subItem.title = subWorks[index].code + " " + subWorks[index].title;
                subItem.description = subWorks[index].description;
                subItem.image = "http://www.basicprimitives.com/demo/images/photos/b.png";
                if (subWorks[index].hasOwnProperty('subWorks')) {
                    var subSubWorks = subWorks[index].subWorks;
                    for (var j = 0; j < subSubWorks.length; j++) {
                        //console.log(j + ": " + subSubWorks[j].code);
                        var subSubItem = new primitives.orgdiagram.ItemConfig();
                        subSubItem.code = subSubWorks[j].code;
                        subSubItem.title = subSubWorks[j].code + " " + subSubWorks[j].title;
                        subSubItem.description = subSubWorks[j].description;
                        subSubItem.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                        subItem.items.push(subSubItem);
                    }
                    subItem.items.sort(function (a, b) {
                        var codeA = a.code;
                        var codeB = b.code;
                        if (codeA > codeB) return 1;
                        if (codeA < codeB) return -1;
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
            $("#orgdiagram").orgDiagram(options);

        }

        function SetupPBSWidget(data) {
            var options = new primitives.orgdiagram.Config();
            var rootItem = new primitives.orgdiagram.ItemConfig();
            rootItem.title = data.name;
            rootItem.description = data.description;
            rootItem.image = "http://www.basicprimitives.com/demo/images/photos/a.png";
            var subProjects = data.subProjects;
            for (var index = 0; index < subProjects.length; index++) {
                var subItem = new primitives.orgdiagram.ItemConfig();
                subItem.code = subProjects[index].code;
                subItem.title = subProjects[index].code + " " + subProjects[index].name;
                subItem.description = subProjects[index].description;
                subItem.image = "http://www.basicprimitives.com/demo/images/photos/b.png";
                if (subProjects[index].hasOwnProperty('subProjects')) {
                    var subSubProjects = subProjects[index].subProjects;
                    for (var j = 0; j < subSubProjects.length; j++) {
                        var subSubItem = new primitives.orgdiagram.ItemConfig();
                        subSubItem.code = subSubProjects[j].code;
                        subSubItem.title = subSubProjects[j].code + " " + subSubProjects[j].name;
                        subSubItem.description = subSubProjects[j].description;
                        subSubItem.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                        subItem.items.push(subSubItem);
                    }
                    subItem.items.sort(function (a, b) {
                        var codeA = a.code;
                        var codeB = b.code;
                        if (codeA > codeB) return 1;
                        if (codeA < codeB) return -1;
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
            jQuery(diagramDiv).addClass('span11');

        }


    </r:script>
</head>

<body>

<div class="row-fluid">

    <am:boxContainer icon="list" span="12" title="范围管理" canFold="false">
        <ul class="nav tab-menu nav-tabs" id="myTab">
            <li class="active"><a href="#wbsPane">WBS工作分解</a></li>
            <li><a href="#pbsPane">PBS工作分解</a></li>
        </ul>

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active" style="min-height: 600px" id="wbsPane">
                <div class="box-conent buttons">
                    <div class="btn-group">
                        <button class="btn btn-large">选择WBS版本..</button>
                        <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span
                                class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" id="wbsMenu">
                            <g:each in="${Workbreakdown.list()}" var="wbs">
                                <li><a href="#"><i class="halflings-icon star"></i><span
                                        class="hidden">${wbs.code}</span><span>${wbs.title}</span></a>
                                    <g:link class="btn btn-mini" action="turnWBSWorksIntoTasks"
                                            params="[wbsId: wbs.id]">变</g:link>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                    <g:link class="btn btn-large btn-primary" action="addWorks">Add Works</g:link>
                </div>

                <div id="orgdiagram"
                     style="min-height: 360px; position:absolute; overflow:hidden; border-width:1px;">

                </div>
            </div>

            <div class="tab-pane" style="min-height: 600px" id="pbsPane">
                <div class="box-conent buttons">
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
                    <g:link class="btn btn-large btn-primary" action="addWorks">Add Works</g:link>
                </div>


                <div id="pbsdiagram"
                     style="min-height: 360px; position:absolute; overflow:hidden; border-width:1px;"></div>
            </div>
        </div>
    </am:boxContainer>
</div>

<div class="row-fluid">
    <am:boxContainer title="工作/项目分解列表" canFold="false" icon="list" span="12">
        <ul class="nav tab-menu nav-tabs" id="myTab">
            <li class="active"><a href="#workPane">工作</a></li>
            <li><a href="#taskPane">任务</a></li>
        </ul>

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active" id="workPane">

                <table class="table datatable bootstrap-datatable">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>名称</th>
                        <th>描述</th>
                        <th></th>
                    </tr>
                    </thead>
                    <g:each in="${Work.list()}" var="work">
                        <tr><td>${work.code}</td>
                            <td>${work.title}</td>
                            <td>${work.description}</td>
                            <td>
                                <g:link action="turnIntoTask" params="[workId: work.id]"
                                        class="label label-important" alt="xxxx">T</g:link>
                            </td></tr>
                    </g:each>
                </table>

            </div>

            <div class="tab-pane" id="taskPane">

                <table class="table table-datatable datatable bootstrap-datatable">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>名称</th>
                        <th>描述</th>
                        <th></th>
                    </tr>
                    </thead>
                    <g:each in="${Task.list()}" var="task">
                        <tr><td>${task.code}</td>
                            <td>${task.title}</td>
                            <td>${task.description}</td>
                            <td>
                                <g:link action="turnIntoTask" params="[taskId: task.id]"
                                        class="label label-important" alt="xxxx">T</g:link>
                            </td></tr>
                    </g:each>
                </table>

            </div>
        </div>
    </am:boxContainer>
</div>
</body>
</html>