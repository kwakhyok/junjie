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

        function main(){
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

        function SetupWidget1() {
            var options = new primitives.orgdiagram.Config();
            var rootItem = new primitives.orgdiagram.ItemConfig();
            rootItem.title = "Title 4";
            rootItem.description = "Description";
            rootItem.image = "http://www.basicprimitives.com/demo/images/photos/a.png";
            for (var index = 0; index < 5; index++) {
                var itemD = new primitives.orgdiagram.ItemConfig();
                itemD.title = index.toString() + " Title";
                itemD.description = index.toString() + " Description";
                itemD.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                rootItem.items.push(itemD);
            }

            var itemB = new primitives.orgdiagram.ItemConfig();
            itemB.title = "B Title";
            itemB.description = "B Description";
            itemB.image = "http://www.basicprimitives.com/demo/images/photos/b.png";
            rootItem.items.push(itemB);
            for (var index = 0; index < 5; index++) {
                var itemD = new primitives.orgdiagram.ItemConfig();
                itemD.title = index.toString() + " Title";
                itemD.description = index.toString() + " Description";
                itemD.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                itemB.items.push(itemD);
            }

            var itemC = new primitives.orgdiagram.ItemConfig();
            itemC.title = "C Title";
            itemC.description = "C Description";
            itemC.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
            rootItem.items.push(itemC);

            for (var index = 0; index < 5; index++) {
                var itemD = new primitives.orgdiagram.ItemConfig();
                itemD.title = index.toString() + " Title";
                itemD.description = index.toString() + " Description";
                itemD.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                itemC.items.push(itemD);
            }

            options.rootItem = rootItem;
            options.cursorItem = rootItem;
            options.hasSelectorCheckbox = primitives.common.Enabled.True;
            jQuery("#orgdiagram").orgDiagram(options);
        }


        function SetupWidget2(root, items) {
            var options = new primitives.orgdiagram.Config();
            var rootItem = new primitives.orgdiagram.ItemConfig();
            rootItem.title = root.title;
            rootItem.description = root.description;
            rootItem.image = "http://www.basicprimitives.com/demo/images/photos/a.png";
            for (var index = 0; index < items.length; index++) {
                var itemD = new primitives.orgdiagram.ItemConfig();
                console.log(index);
                itemD.title = items[index].title;
                itemD.description = items[index].description;
                console.log(itemD.code + ' \'s parent is: ' + items[index].parentWork);
                itemD.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                rootItem.items.push(itemD);
            }
            options.rootItem = rootItem;
            options.cursorItem = rootItem;
            options.hasSelectorCheckbox = primitives.common.Enabled.True;
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
            jQuery("#orgdiagram").addClass('span11');

        }

        /* $(function(){
         $('#wbsMenu li a').live('click',function(event,data){
         event.preventDefault();
         })
         });*/




        /*  == .live(), but in jquery 1.8 there's more preformant way! */
        $(document).delegate('#wbsMenu li a', 'click', function (event, data) {
            console.log('this: ' +  $(this).children('span.hidden').text() + ' type: ' +  event.type);
            var myWbsId = $(this).children('span.hidden').text();
            $.getJSON("listWorksAsJson", {wbsId:myWbsId}, function (data) {

                console.log(data.rootItem.title);

                $.each(data.items, function(i, item){
                    console.log(i + ":" + item.title);
                });

                ResizePlaceholder();
                SetupWidget2(data.rootItem, data.items);
                $(window).resize(function () {
                    onWindowResize();
                });

                var items = [];
                $.each(data, function (key, val) {
                    items.push('<li>' + key + ":" + val + "</li>");
                    parseMe(key,val);
                });
                $('<ul/>', {'class':'my-new-list', html:items.join('')}).appendTo('body');
            });
            event.preventDefault();
        });

        function parseMe(key, val){
            console.log('parse me: ' + key + ':' + val);
            if(key == 'rootItem'){
                var options = new primitives.orgdiagram.Config();
                var rootItem = new primitives.orgdiagram.ItemConfig();
                rootItem.title = val.title;
                rootItem.description = val.description;
                options.rootItem = rootItem;
                options.cursorItem = rootItem;
                options.hasSelectorCheckbox = primitives.common.Enabled.True;
                console.log('root title' + options.rootItem.title);
              //  jQuery("#orgdiagram").orgDiagram(options);
              //  main();
            }

        }

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
                                        class="halflings-icon star"></i><span class="hidden">${wbs.id}</span><span>${wbs.title}</span></a></li>
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