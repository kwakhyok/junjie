<%--
  Created by IntelliJ IDEA.
  User: lujuemin
  Date: 5/14/13
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main"/>
    <r:require module="acme"/>

    <title>news details</title>
    <style>
    ul.dashboard-list li.headNews div{display: block;}
    ul.dashboard-list li.headNews div.detailNews{display: none;}
    ul.dashboard-list li.headNews a{display:none;}
    ul.dashboard-list li.normalNews div{display: none;}

    </style>
    <r:script>

        $(function(){

            $("ul.dashboard-list li.headNews div.container-fluid div.image img").clone().appendTo($("div.detail"));
            $("ul.dashboard-list li.headNews div.container-fluid div.detailNews").clone().appendTo($("div.detail"));
            $("ul.dashboard-list li").each(function(i){
                $(this).click(function(){
                    $("li.headNews").removeClass("headNews").addClass("normalNews");
                    $(this).removeClass("normalNews").addClass("headNews");
                    var list = $("div.detail");
                    list.children().remove();
                    $("ul.dashboard-list li.headNews div.container-fluid div.image img").clone().appendTo($(list));
                    $("ul.dashboard-list li.headNews div.container-fluid div.detailNews").clone().appendTo($(list));
                });
            });

        });

    </r:script>
</head>
<body>
<div class="box span6" onTablet="span8" onDesktop="span7">
    <div class="box-header title">
        <h2><i class="halflings-icon list"></i><span class="break"></span>新闻标题</h2>

        <div class="box-icon">
            <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
            <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
        </div>
    </div>

    <div class="box-content">
        <div class="container-fluid">
            <ul class="dashboard-list">
                <li class="headNews">
                    <a href="#">
                        <i class="fa-icon-arrow-down green"></i>
                        <span class="green">125</span>
                        新院区建设推进协调会召开
                    </a>
                    <div class="container-fluid">

                        <div class="span4 image">
                            <img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" height="200" alt="">
                        </div>

                        <div class="span8 previewNews">
                            <p>为加快新院工程建设进度，确保工程质量，3月28日上午，院领导班子到新院区建设工地进行现场办公。
                            在新区建设工地，院领导一行深入实地查看了新区建设工地现场，了解了各项工程的施工进度。在全面细致了解新区基本建设情况后，对于需要多个部门协调的问题，
                            院领导当场与项目负责人、施工方进行分析研究、协商讨论，
                            并要求项目部及施工方要按照医院的安排部署加快建设进度，科学合理施工，按时完成建设项目。
                            </p>
                        </div>
                        <div class="detailNews">
                            <p>为加快新院工程建设进度，确保工程质量，3月28日上午，院领导班子到新院区建设工地进行现场办公。
                            在新区建设工地，院领导一行深入实地查看了新区建设工地现场，了解了各项工程的施工进度。在全面细致了解新区基本建设情况后，对于需要多个部门协调的问题，
                            院领导当场与项目负责人、施工方进行分析研究、协商讨论，
                            并要求项目部及施工方要按照医院的安排部署加快建设进度，科学合理施工，按时完成建设项目。
                            blablablabla blablablabla blablablabla blablablabla blablablabla
                            </p>

                        </div>
                    </div>
                </li>
                <li class="normalNews">
                    <a href="#">
                        <i class="fa-icon-arrow-down red"></i>
                        <span class="red">18</span>
                        新院区建设推进协调会召开
                    </a>
                    <div class="container-fluid">
                        <div class="span4 image"><img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" height="200" alt=""></div>
                        <div class="span8 previewNews"><p>昨日,省纠风办公布10部门举报邮箱和电话,欢迎社会各界监督。同日,30名来自社会各界的人士受聘成为
                        政风行风督查员,将在接下来半年内行使调查、监督、评议权力。</p></div>
                        <div class="detailNews"><p>据悉，今年我省将重点从以下8个方面着手纠正侵害群众利益行为和不正之风：纠正教育乱收费、
                        涉企乱收费、涉车涉路乱收费、电信金融等公共服务行业乱收费，以及医药购销和医疗服务不正之风、
                        涉及民生的政府专项资金管理使用问题、涉农领域问题、违法违规强制征地拆迁行为等。省教育厅、省民政厅、省人社厅、省水利厅、
                        省农业厅、省林业厅、省卫生厅、省计生委、省扶贫办、省食药监管局等10个部门及其系统将接受政风行风民主评议；
                        同时，省纠风办将对2012年接受评议的8个部门及其系统开展“回头看”督查工作。</p>
                        </div>
                    </div>
                </li>

                <li class="normalNews">
                    <a href="#">
                        <i class="fa-icon-minus blue"></i>
                        <span class="blue">36</span>
                        庞玉成副院长应邀出席2013亚洲医院建设新格局高峰论坛
                    </a>
                    <div class="container-fluid">
                        <div class="span4 image"><img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" height="200" alt=""></div>
                        <div class="span8 previewNews">去年年底,雅虎邮箱退出了韩国市场。鉴于此,中国雅虎决定,提前向用户提供邮箱迁移方案,以方便用户更早地转换邮箱地址,对邮箱内的资料做出安排。 </div>
                        <div class="detailNews"><p>雅虎公司前不久在其官方网站上发布公告称：“中国雅虎邮箱将于2013年8月19日全部停止服务，届时，邮件及相关账户信息都将删除且无法恢复。”对于这个消息，很多雅虎邮箱的用户感到猝不及防。</p></div>
                    </div>
                </li>

                <li class="normalNews">
                    <a href="#">
                        <i class="fa-icon-comment yellow"></i>
                        <span class="yellow">45</span>
                        滨州市中心医院考察组参观我院新院区
                    </a>
                    <div class="container-fluid">
                        <div class="span4 image"><img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" height="200" alt=""></div>
                        <div class="span8 previewNews">邮箱已经成为企业内外部沟通的必备品,也是企业办公的必需品。所来往的邮件都要存储在邮件终端中,也就是大家最常提及的“收件箱”。</div>
                        <div class="detailNews"><p>众所周知，最早的企业邮箱是以“大小”售卖的，例如3用户“2G”，很可能因为同事接收的一封大邮件导致自己邮箱无法正常收发信息。作为企业邮箱第一品牌的263企业邮箱，率先打破“魔咒”。以“用户”为单位提供服务，即每用户可拥有263G的邮箱空间，避免了定期清理邮件的繁琐步骤，同时也提升了邮件查询、检索的效率。</p></div>
                    </div>
                </li>
                <li class="normalNews">
                    <a href="#">
                        <i class="fa-icon-arrow-up green"></i>
                        <span class="green">112</span>
                        我院被评为烟台市重点项目重要工作推进先进集体
                    </a>
                    <div class="container-fluid">
                        <div class="span4 image"><img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" height="200" alt=""></div>
                        <div class="span8 previewNews">继中国雅虎邮箱上月宣布即将关停后,曾经的全球第一大网页邮箱Hotmail也宣布完成迁移。Hot-mail和中国雅虎邮箱这些耳熟能详的名字即将成为历史,</div>
                        <div class="detailNews"><p>Hotmail消亡并非免费邮箱强制用户迁移的第一例。此前的4月18日，中国雅虎邮箱用户就收到过一封关停通知，运营方称邮箱将于2013年8月19日停止服务，建议用户从即日起开始转移邮件、联系人等个人数据信息。</p></div>
                    </div>
                </li>

                <li class="normalNews">
                    <a href="#">
                        <i class="fa-icon-arrow-down red"></i>
                        <span class="red">31</span>
                        我院可再生能源建筑应用示范项目获财政补贴
                    </a>
                    <div class="container-fluid">
                        <div class="span4 image"><img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" height="200" alt=""></div>
                        <div class="span8 previewNews">长春亚泰足球俱乐部官方校园代理：</div>
                        <div class="detailNews"><p>长春亚泰足球俱乐部官方校园代理：1、吉林大学南校区 姚远 电话：18204310698 邮箱：912244016@qq.com 2、长春大学 王家庚 电话：13086891812 邮箱：187088693@qq.com 另外，比赛现场不售卖学生票，学生票凭学生证进场。</p></div>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div><!--/span-->
<div class="box span6" onTablet="span8" onDesktop="span7">
    <div class="box-header">
        <h2><i class="halflings-icon list"></i><span class="break"></span>新闻内容</h2>

        <div class="box-icon">
            <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
            <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
        </div>
    </div>
    <div class="box-content detail" style="min-height: 350px;">

    </div>
</div>
</body>

</html>