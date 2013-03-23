
<!-- start: Main Menu -->
<div id="sidebar-left" class="span1">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li><g:link controller="home"><i class="fa-icon-bar-chart"></i><span class="hidden-tablet"> 主页</span></g:link></li>
            <li><g:link controller="information"><i class="fa-icon-folder-open"></i><span class="hidden-tablet"> 信息</span></g:link></li>
            <li><g:link controller="message"><i class="fa-icon-envelope"></i><span class="hidden-tablet"> 沟通</span></g:link></li>
            <li><g:link controller="task"><i class="fa-icon-sitemap"></i><span class="hidden-tablet"> 范围</span></g:link></li>
            <li>
                %{--<g:link controller="gantt"><i class="fa-icon-tasks"></i><span class="hidden-tablet"> 进度</span></g:link>--}%
                <a class="dropmenu" href="#"><i class="fa-icon-folder-close-alt"></i><span class="hidden-tablet"> 进度</span></a>
                <ul>
                    <li><g:link controller="gantt" class="submenu"><i class="fa-icon-tasks"></i><span class="hidden-tablet">甘特图</span></g:link></li>
                    <li><g:link controller="timeline" class="submenu"><i class="fa-icon-file-alt"></i><span class="hidden-tablet">时间轴</span></g:link></li>
                </ul>
            </li>
            <li><g:link controller="contract"><i class="fa-icon-inbox"></i><span class="hidden-tablet"> 合同</span></g:link></li>
            <li><g:link controller="design"><i class="fa-icon-dashboard"></i><span class="hidden-tablet"> 设计</span></g:link></li>
            <li><g:link controller="investment"><i class="fa-icon-money"></i><span class="hidden-tablet"> 投资</span></g:link></li>
            <li><g:link controller="supervision"><i class="fa-icon-eye-open"></i><span class="hidden-tablet"> 监理</span></g:link></li>
            <li><g:link controller="administrator"><i class="fa-icon-cogs"></i><span class="hidden-tablet"> 系统</span></g:link></li>
            <li><g:link controller="gallery"><i class="fa-icon-picture"></i><span class="hidden-tablet"> 现场</span></g:link></li>
            <li><g:link controller="calendar"><i class="fa-icon-calendar"></i><span class="hidden-tablet"> 日历</span></g:link></li>
        </ul>
    </div>
</div>

<noscript>
    <div class="alert alert-block span11">
        <h4 class="alert-heading">Warning!</h4>
        <p>You need to have javascript enabled to use this site.</p>
    </div>
</noscript>
<!-- end: Main Menu -->