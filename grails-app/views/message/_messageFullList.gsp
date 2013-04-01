<div class="row-fluid">

    <div class="span7">
        <h2>我收到的讯息</h2>

        <ul class="messagesList">
            <g:set var="times" value="50"/>
            <g:each in="['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'I', 'G', 'K', 'L', 'M', 'N', 'O', 'P', 'Q']"
                    status="i" var="number">
                <%
                    def stars = ['glyphicons star', 'glyphicons dislikes']
                    def labels = ['信息': 'label label-info', '任务': 'label label-success', '问题': 'label label-warning']
                    Collections.shuffle(stars)
                    def cssStar = stars.get(0)
                    Random generator = new Random()
                    def values = labels.values().toArray()
                    def keys = labels.keySet().toArray()
                    def num = generator.nextInt(keys.length)
                    def cssLabel = values[num]
                    def label = keys[num]
                %>


                <li>
                    <span class="from"><span class="${cssStar}"><i></i></span> 庞玉成 <span
                            class="glyphicons paperclip"><i></i></span></span><span class="title"><span
                        class="${cssLabel}">${label}</span> 幕墙招标${number}已经结束</span><span
                        class="date">今天, <b>3:47 PM</b></span>
                </li>
            </g:each>

        </ul>

    </div>

    <div class="span5 noMarginLeft">

        <div class="message dark">

            <div class="header">
                <h1>"pvc地板采购评标报告"</h1>

                <div class="from"><i class="halflings-icon user"></i> 编号:<b>BYYTFY-2012-23</b> </div>

                <div class="date"><i class="halflings-icon time"></i> <am:formatDate
                        date="${new java.util.Date()}"/> <b>3:47 PM</b></div>

                <div class="menu"></div>

            </div>

            <div class="content">
                <p>

                    采购人：滨州医学院烟台附属医院（烟台市牟平区人民医院）
                    项目名称：滨州医学院烟台附属医院pvc地板采购

                </p>

                <p>
                    二、采购过程简介
                    1、2012年11月对滨州医学院烟台附属医院pvc地板进行竞争性谈判采购。在此期间，共有18家投标人报名并购买了谈判文件。
                    2、截止到2012年11月15日8：30，共有14家企业在有效时间内投递了投标文件（具体名称详见投标文件递交登记表）。
                </p>

                <p>
                    三、开标会议
                    1、开标时间：2012年12月3日 8：30时
                    2、开标地点：滨州医学院烟台附属新院工地
                    3、与会单位：
                    采购人：滨州医学院烟台附属医院       庞玉成
                    4、开标记录（附后）。
                </p>


                <p>
                    四、评标意见
                    1、评标委员会对所有投标人的投标文件进行详细评审，并根据评标办法中规定的各项因素对所有合格的投标人进行综合评审打分。
                    2、评标委员会推荐的入围单位：

                <pre>
  一标段：
  山东泰浩国际贸易有限公司
  威海时尚建材有限公司
  南京基盛建筑工程配套有限公司
  二标段：
  威海时尚建材有限公司
  南京基盛建筑工程配套有限公司
  山东泰浩国际贸易有限公司
  三标段：
  南京基盛建筑工程配套有限公司
  威海时尚建材有限公司
  青岛国亨科技实业有限公司
                </pre>
            </p>
            </div>

            <div class="attachments">
                <ul>
                    <li>
                        <span class="label label-important">zip</span> <b>公告正文.zip</b> <i>(2,5MB)</i>
                        <span class="quickMenu">
                            <a href="#" class="glyphicons search"><i></i></a>
                            <a href="#" class="glyphicons share"><i></i></a>
                            <a href="#" class="glyphicons cloud-download"><i></i></a>
                        </span>
                    </li>

                    <li>
                        <span class="label label-success">xls</span> <b>表格.xls</b> <i>(984KB)</i>
                        <span class="quickMenu">
                            <a href="#" class="glyphicons search"><i></i></a>
                            <a href="#" class="glyphicons share"><i></i></a>
                            <a href="#" class="glyphicons cloud-download"><i></i></a>
                        </span>
                    </li>
                </ul>
            </div>
        </div>

    </div>

</div>


<!-- end: Content -->
            </div><!--/#content.span10-->
                </div><!--/fluid-row-->

<div class="modal hide fade" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>

        <h3>Settings</h3>
    </div>

    <div class="modal-body">
        <p>Here settings can be configured...</p>
    </div>

    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
        <a href="#" class="btn btn-primary">Save changes</a>
    </div>
</div>

<div class="clearfix"></div>