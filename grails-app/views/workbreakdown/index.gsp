<%@ page import="cn.com.agilemaster.Workbreakdown" %>
<<html>
<head>
    <title>${meta(name: 'app.name')} -- WBS管理</title>
    <meta content="loggedinacm" name="layout"/>
    <r:require module="acm"/>
    <r:require module="j_primitive"/>
    <r:script>
        var m_timer = null;

        jQuery(document).ready(function () {
            //main();
        });

        function main() {
            ResizePlaceholder();
            SetupWidget();
            $(window).resize(function () {
                onWindowResize();
            });
        }

        function onWindowResize() {
            if (m_timer == null) {
                m_timer = window.setTimeout(function () {
                    ResizePlaceholder();
                    jQuery("#orgdiagram").orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh)
                    window.clearTimeout(m_timer);
                    m_timer = null;
                }, 300);
            }
        }

        function SetupWidget(data) {
            var options = new primitives.orgdiagram.Config();
            var rootItem = new primitives.orgdiagram.ItemConfig();
            rootItem.title = data.title;
            rootItem.description = data.description;
            rootItem.image = "http://www.basicprimitives.com/demo/images/photos/a.png";
            var subWorks = data.subWorks;
            for (var index = 0; index < subWorks.length; index++) {
                var subItem = new primitives.orgdiagram.ItemConfig();
                subItem.code = subWorks[index].code;
                console.log(subItem.code);
                subItem.title = subWorks[index].title;
                subItem.description = subWorks[index].description;
                subItem.image = "http://www.basicprimitives.com/demo/images/photos/b.png";
                if (subWorks[index].hasOwnProperty('subWorks')) {
                    var subSubWorks = subWorks[index].subWorks;
                    for (var j = 0; j < subSubWorks.length; j++) {
                        console.log(j + ": " + subSubWorks[j].code);
                        var subSubItem = new primitives.orgdiagram.ItemConfig();
                        subSubItem.code = subSubWorks[j].code;
                        subSubItem.title = subSubWorks[j].title;
                        subSubItem.description = subSubWorks[j].description;
                        subSubItem.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                        subItem.items.push(subSubItem);
                    }
                }
                rootItem.items.push(subItem);
            }
            options.rootItem = rootItem;
            options.cursorItem = rootItem;
            options.hasSelectorCheckbox = primitives.common.Enabled.False;
            $("#orgdiagram").orgDiagram(options);

        }

        function ResizePlaceholder() {
            /*       var bodyWidth = $(window).width() - 200
             var bodyHeight = $(window).height() - 200
             jQuery("#orgdiagram").css(
             {
             "width":bodyWidth + "px",
             "height":bodyHeight + "px"
             });*/
            jQuery("#orgdiagram").addClass('span12');

        }


        /*  == .live(), but in jquery 1.8 there's more preformant way! */
        $(document).delegate('#wbsMenu li a', 'click', function (event, data) {
            console.log('this: ' + $(this).children('span.hidden').text() + ' type: ' + event.type);
            var myWbsId = $(this).children('span.hidden').text();
            $.getJSON("listWorksAsJson", {wbsId:myWbsId}, function (data) {
                ResizePlaceholder();
                SetupWidget(data);
                $(window).resize(function () {
                    onWindowResize();
                });

                event.preventDefault();
            });
        });
    </r:script>
</head>

<body>
<div class="row-fluid">
    <am:boxContainer icon="list" span="11" title="范围管理" canFold="false">
        <ul class="nav tab-menu nav-tabs" id="myTab">
            <li class="active"><a href="#wbsPane">WBS工作分解</a></li>
            <li><a href="#pbsPane">PBS工作分解</a></li>
        </ul>

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active" style="min-height: 400px" id="wbsPane">
                <div class="box-conent buttons">
                    <div class="btn-group">
                        <button class="btn btn-large">选择版本..</button>
                        <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" id="wbsMenu">
                            <g:each in="${Workbreakdown.list()}" var="wbs">
                                <li><a href="#"><i
                                        class="halflings-icon star"></i><span
                                        class="hidden">${wbs.id}</span><span>${wbs.title}</span></a></li>
                            </g:each>
                        </ul>
                    </div>
                    <g:link class="btn btn-large btn-primary" action="addWorks">Add Works</g:link>
                </div>


                <div id="orgdiagram"
                     style="min-height: 360px; position:absolute; overflow:hidden; border-width:1px;"></div>
            </div>

            <div class="tab-pane" style="min-height: 360px" id="pbsPane">
                <h2>PBS pane</h2>
            </div>
        </div>
    </am:boxContainer>

</div>

</body>
</html>