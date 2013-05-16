<ul class="nav tab-menu nav-tabs" id="myTab">
    <li id="projectGantt"><a href="#gantt">甘特图</a></li>
    <li id="projectProcess" class="active"><a href="#process">进行图</a></li>
</ul>
<div class="container-fluid" style="overflow: scroll;">
    <div class="gantt hiddenProcess" id="GanttChartDIV1"></div>
</div>

<div class="box-content">
    <div class="photos" style="margin: 30px;">
        <div id="this-carousel-id" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active"><!-- class of active since it's the first item -->
                    <img src="${createLinkTo(dir: 'img/pics', file: '21.jpeg')}" width="800" alt=""/>

                    <div class="carousel-caption">
                        <p>门诊楼内部工程进度</p>
                    </div>
                </div>

                <div class="item">
                    <img src="${createLinkTo(dir: 'img/pics', file: '22.jpeg')}" width="800" alt=""/>

                    <div class="carousel-caption">
                        <p>门诊楼外部工程进度</p>
                    </div>
                </div>

                <div class="item">
                    <img src="${createLinkTo(dir: 'img/pics', file: '23.jpeg')}" width="800" alt=""/>

                    <div class="carousel-caption">
                        <p>唐山市开平区党政考察团参观新院区工地</p>
                    </div>
                </div>

            </div><!-- /.carousel-inner -->
        <!--  Next and Previous controls below
    href values must reference the id for this carousel -->

            <a class="carousel-control left" href="#this-carousel-id" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#this-carousel-id" data-slide="next">&rsaquo;</a>
        </div><!-- /.carousel -->
    </div>
</div>

<r:script>
    $('.carousel').carousel();
    // here's all the html code neccessary to display the chart object
    // Future idea would be to allow XML file name to be passed in and chart tasks built from file.
    var g = new JSGantt.GanttChart('g', document.getElementById('GanttChartDIV1'), 'day');

    g.setShowRes(1); // Show/Hide Responsible (0/1)
    g.setShowDur(1); // Show/Hide Duration (0/1)
    g.setShowComp(1); // Show/Hide % Complete(0/1)
    g.setCaptionType('none');  // Set to Show Caption (None,Caption,Resource,Duration,Complete)


    //var gr = new Graphics();

    if (g) {

        // Parameters             (pID, pName,pStart, pEnd, pColor,   pLink,  pMile, pRes,  pComp, pGroup, pParent, pOpen, pDepend, pCaption)

        // You can also use the XML file parser JSGantt.parseXML('project.xml',g)

        g.AddTaskItem(new JSGantt.TaskItem(1, '采购', '', '', 'ff0000', 'http://help.com', 0, '卢珏玟', 1, 1, 0, 1));
        g.AddTaskItem(new JSGantt.TaskItem(11, '意向企业签到', '6/25/2012', '6/28/2012', 'ff00ff', 'http://www.yahoo.com', 1, '梁晶', 100, 0, 1, 1));
        g.AddTaskItem(new JSGantt.TaskItem(12, '登记企业', '', '', '00ff00', '', 0, '王一', 40, 1, 1, 1));
        g.AddTaskItem(new JSGantt.TaskItem(121, '登记投标企业', '7/28/2012', '8/24/2012', '00ffff', 'http://www.yahoo.com', 0, '王一 T.', 60, 0, 12, 1));
        g.AddTaskItem(new JSGantt.TaskItem(122, '登记参建企业', '8/2/2012', '8/14/2012', 'ff0000', 'http://help.com', 0, '王一', 60, 0, 12, 1, 121));
        g.AddTaskItem(new JSGantt.TaskItem(123, '等级专家库', '7/6/2012', '8/13/2012 12:00', 'ffff00', 'http://help.com', 0, '李向阳', 60, 0, 12, 1, 121));
        g.AddTaskItem(new JSGantt.TaskItem(124, '登记图纸库', '8/2/2012', '8/29/2012', 'ff0000', 'http://help.com', 0, '黄旭峰', 60, 0, 12, 1, 0, 'This is another caption'));
        g.AddTaskItem(new JSGantt.TaskItem(2, '合同', '8/24/2012', '8/25/2012', 'ffff00', 'http://help.com', 0, '王一', 20, 0, 0, 1, 122));
        g.AddTaskItem(new JSGantt.TaskItem(21, '合同台账', '8/22/2012', '8/21/2012', 'ffff00', 'http://help.com', 0, '王一', 20, 0, 0, 1, 122));
        g.AddTaskItem(new JSGantt.TaskItem(22, '合同付款', '6/24/2012', '7/25/2012', 'ffff00', 'http://help.com', 0, '王一', 20, 0, 0, 1, 122));
        g.AddTaskItem(new JSGantt.TaskItem(3, '设计', '', '', 'ff0000', 'http://help.com', 0, '张三', 0, 1, 0, 1));
        // 饰装修设计、智能化设计、信息化设计、市政设计、绿化景观设计、高压氧仓设计、直线加速器、污水处理站设计、标示导向系统设计、血透中心设计、厨房工艺设计、直饮水设计、医用纯水设计、医用气体工程设计、手术室、ICU净化设计、防护设计、中心供应室设计、生殖中心设计、检验科设计、静脉配置中心设计、太阳能设计、物流系统设计等
        g.AddTaskItem(new JSGantt.TaskItem(31, '饰装修设计', '7/25/2012', '8/17/2012', 'ff00ff', 'http://help.com', 0, '王一', 30, 0, 3, 1, '', 'Caption 1'));
        g.AddTaskItem(new JSGantt.TaskItem(32, '市政设计', '8/15/2012', '8/24/2012', '00ff00', 'http://help.com', 0, '梁晶', 40, 0, 3, 1));
        g.AddTaskItem(new JSGantt.TaskItem(33, '绿化景观设计', '', '', '00ff00', 'http://help.com', 0, '赵帅', 40, 1, 3, 1));
        g.AddTaskItem(new JSGantt.TaskItem(332, '高压氧仓设计', '8/6/2012', '8/11/2012', '0000ff', 'http://help.com', 0, '王一', 60, 0, 33, 1));
        g.AddTaskItem(new JSGantt.TaskItem(333, '直线加速器', '8/9/2012', '8/20/2012', '0000ff', 'http://help.com', 0, '王一', 60, 0, 33, 1));
        g.AddTaskItem(new JSGantt.TaskItem(34, '污水处理站设计', '', '', '990000', 'http://help.com', 0, '王茜', 60, 1, 3, 0));
        g.AddTaskItem(new JSGantt.TaskItem(341, '信息化设计', '8/26/2012', '9/11/2012', 'ff0000', 'http://help.com', 0, '庞玉成', 60, 0, 34, 1));
        g.AddTaskItem(new JSGantt.TaskItem(342, '标示导向系统设计', '9/12/2012', '10/18/2012', 'ff6666', 'http://help.com', 0, '庞玉成', 60, 0, 34, 1));
        g.AddTaskItem(new JSGantt.TaskItem(343, '血透中心设计', '10/13/2012', '10/17/2012', 'ff0000', 'http://help.com', 0, '庞玉成', 60, 0, 34, 1));
        g.AddTaskItem(new JSGantt.TaskItem(344, '直饮水设计', '10/17/2012', '11/04/2012', 'ff0000', 'http://help.com', 0, '庞玉成', 60, 0, 34, 1, "342,343"));
        g.AddTaskItem(new JSGantt.TaskItem(35, '医用纯水设计', '12/17/2012', '2/04/2013', 'f600f6', 'http://help.com', 0, '庞玉成', 30, 0, 3, 1));
        g.AddTaskItem(new JSGantt.TaskItem(35, '厨房工艺设计', '12/17/2012', '2/04/2013', 'f600f6', 'http://help.com', 0, '庞玉成', 30, 0, 3, 1));
        g.AddTaskItem(new JSGantt.TaskItem(35, '医用气体工程设计', '12/17/2012', '2/04/2013', 'f600f6', 'http://help.com', 0, '庞玉成', 30, 0, 3, 1));
        g.AddTaskItem(new JSGantt.TaskItem(35, '静脉配置中心设计', '12/17/2012', '2/04/2013', 'f600f6', 'http://help.com', 0, '庞玉成', 30, 0, 3, 1));
        g.AddTaskItem(new JSGantt.TaskItem(35, '物流系统设计', '12/17/2012', '2/04/2013', 'f600f6', 'http://help.com', 0, '庞玉成', 30, 0, 3, 1));
        g.Draw();
        g.DrawDependencies();

    }

    else {

        alert("not defined");

    }
    $(function(){
        $("ul#myTab li#projectProcess").click(function(){
            $("div#process2 div.hiddenProcess").removeClass("hiddenProcess");
            $("div#process2 div.gantt").addClass("hiddenProcess");
        });
        $("ul#myTab li#projectGantt").click(function(){
            $("div#process2 div.hiddenProcess").removeClass("hiddenProcess");
            $("div#process2 div.photos").addClass("hiddenProcess");
        });
    });
</r:script>