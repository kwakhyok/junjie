<li class="dropdown hidden-phone">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white tasks"></i>
    </a>
    <ul class="dropdown-menu tasks">
        <li>
            <span class="dropdown-menu-title">您有<b>${myTaskList?.size()}</b>个任务正在进行中</span>
        </li>
        <g:each in="${myTaskList}" var="task">

             <am:renderTaskPercentage task="${task}"/>
        </g:each>
        <li>
            <a href="#">
                <span class="header">
                    <span class="title">iOS Development</span>
                    <span class="percent"></span>
                </span>

                <div class="taskProgress progressSlim progressBlue">80</div>
            </a>
        </li>

        <li>
            <a href="#">
                <span class="header">
                    <span class="title">Django Project For Google</span>
                    <span class="percent"></span>
                </span>

                <div class="taskProgress progressSlim progressBlue">32</div>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="header">
                    <span class="title">SEO for new sites</span>
                    <span class="percent"></span>
                </span>

                <div class="taskProgress progressSlim progressBlue">63</div>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="header">
                    <span class="title">New blog posts</span>
                    <span class="percent"></span>
                </span>

                <div class="taskProgress progressSlim progressBlue">80</div>
            </a>
        </li>
        <li>
            <a class="dropdown-menu-sub-footer">查看所有任务</a>
        </li>
    </ul>
</li>