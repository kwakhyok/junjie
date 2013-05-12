<!-- start: Main Menu -->
<div id="sidebar-left" class="span1">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li>
                <a class="dropmenu" href="#"><i class="fa-icon-folder-close-alt"></i><span
                        class="hidden-tablet">日常</span></a>
                <ul>
                    <shiro:hasPermission permission="message:*">
                        <li><g:link controller="message" class="submenu"><i class="fa-icon-bullhorn"></i><span
                                class="hidden-tablet">消息</span></g:link></li>
                    </shiro:hasPermission>

                    <shiro:hasPermission permission="calendar:*">
                        <li><g:link controller="calendar" class="submenu"><i class="fa-icon-calendar"></i><span
                                class="hidden-tablet">日历</span></g:link></li>
                    </shiro:hasPermission>

                    <shiro:hasPermission permission="supervision:*">
                        <li><g:link controller="supervision" class="submenu"><i class="fa-icon-eye-open"></i><span
                                class="hidden-tablet">监理</span></g:link></li>
                    </shiro:hasPermission>

                    <shiro:hasPermission permission="backend:*">
                        <li><g:link controller="backend" class="submenu"><i class="fa-icon-cogs"></i><span
                                class="hidden-tablet">后台</span></g:link></li>
                    </shiro:hasPermission>
                </ul>
            </li>


            <shiro:hasPermission permission="information:*">
                <li><g:link controller="information"><i class="fa-icon-book"></i><span
                        class="hidden-tablet">文库</span></g:link></li>
            </shiro:hasPermission>


            <shiro:hasPermission permission="task:*">
                <li>
                    <a class="dropmenu" href="#"><i class="fa-icon-folder-close-alt"></i><span
                            class="hidden-tablet">任务</span></a>
                    <ul>
                        <li><g:link controller="workbreakdown" class="submenu"><i class="fa-icon-sitemap"></i><span
                                class="hidden-tablet">部署</span></g:link></li>
                        <li><g:link controller="gantt" class="submenu"><i class="fa-icon-tasks"></i><span
                                class="hidden-tablet">甘特图</span></g:link></li>
                        <li><g:link controller="timeline" class="submenu"><i class="fa-icon-time"></i><span
                                class="hidden-tablet">时间轴</span></g:link></li>
                    </ul>
                </li>
            </shiro:hasPermission>

            <shiro:hasPermission permission="design:*">
                <li><g:link controller="design"><i class="fa-icon-dashboard"></i><span
                        class="hidden-tablet">设计</span></g:link></li>
            </shiro:hasPermission>
            <shiro:hasPermission permission="purchase:*">
                <li><g:link controller="purchase"><i class="fa-icon-shopping-cart"></i><span
                        class="hidden-tablet">采购</span></g:link></li>
            </shiro:hasPermission>
            <shiro:hasPermission permission="contract:*">

                <li><g:link controller="contract"><i class="fa-icon-inbox"></i><span
                        class="hidden-tablet">合同</span></g:link></li>
            </shiro:hasPermission>

            <shiro:hasPermission permission="construction:*">

                <li><g:link controller="construction"><i class="fa-icon-inbox"></i><span
                        class="hidden-tablet">施工</span></g:link></li>
            </shiro:hasPermission>


            <shiro:hasPermission permission="investment:*">
                <li><g:link controller="investment"><i class="fa-icon-money"></i><span
                        class="hidden-tablet">投资</span></g:link></li>
            </shiro:hasPermission>
        </ul>
    </div>
</div>

<!-- end: Main Menu -->