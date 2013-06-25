<%@ page import="cn.com.agilemaster.MessageRecipient; cn.com.agilemaster.User; org.apache.shiro.SecurityUtils" %>
<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- start: Favicon and Touch Icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-144-precomposed.png')}"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-114-precomposed.png')}"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-72-precomposed.png')}"/>
    <link rel="apple-touch-icon-precomposed"
          href="${createLinkTo(dir: 'acm/ico', file: 'apple-touch-icon-57-precomposed.png')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'acm/ico', file: 'favicon.png')}"/>
    <!-- end: Favicon and Touch Icons -->
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>

<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse"
               data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <g:link controller="newHome" action="newindex" class="brand">
                <span></span>
                <img src="${createLinkTo(dir: 'img', file: 'amlogo.png')}">
            </g:link>
        <!-- start: Header Menu -->
            <div class="nav-no-collapse header-nav">
                <ul class="nav pull-right">
                    <g:render template="/newHome/messageNotification"/>
                    <!-- start: Notifications Dropdown -->
                    <g:render template="/newHome/progressNotification"/>
                    <!-- end: Notifications Dropdown -->
                    <!-- start: Message Dropdown -->
                    <g:render template="/newHome/privateNotification"/>
                    <!-- end: Message Dropdown -->
                    <!-- start: User Dropdown -->
                    <g:render template="/newHome/userOperation"/>
                    <!-- end: User Dropdown -->
                </ul>
            </div>
            <!-- end: Header Menu -->
        </div>
    </div>
</div>


<div class="container-fluid">
    <div class="row-fluid">
        <g:render template="/newHome/mainMenu"/>
        <div id="content" class="span11">
            <g:layoutBody/>
        </div>

        <div id="widgets-area" class="span11" style="display:none;">
            <ul class="nav tab-menu nav-tabs" id="myTab">
                <li><a href="#charts"><i class="fa-icon-bar-chart"></i></a></li>
                <li><a href="#users"><i class="fa-icon-group"></i></a></li>
                <li><a href="#messages"><i class="fa-icon-envelope"></i></a></li>
                <li><a id="close-widgets-area" href="#"><i class="fa-icon-signin"></i></a></li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active" id="charts">
                    <div class="bar-stat">
                        <span class="title">投资概览</span>
                        <span class="value">208,299万元</span>
                        <span class="chart yellow">3,4,7,9,10,12,14,20,19,22,24,25</span>
                    </div>
                    <hr>

                    <div class="bar-stat">
                        <span class="title">进场单位</span>
                        <span class="value">28家</span>
                        <span class="chart blue">2,4,6,8,3,5,9,3,2,2</span>
                    </div>
                    <hr>

                    <div class="bar-stat">
                        <span class="title">已招标项目</span>
                        <span class="value">84</span>
                        <span class="chart red">0,3,3,8,3,3,2,7,8,4</span>
                    </div>
                    <hr>

                    <div class="bar-stat">
                        <span class="title">设计图纸</span>
                        <span class="value">84</span>
                        <span class="chart green">0,3,3,8,3,3,2,7,8,4</span>
                    </div>

                    <hr>

                    <div id="overview-percentage"></div>




                    <ul class="progress-bars">

                        <li>
                            <span class="title">投资到位情况</span>
                            <span class="percent"></span>

                            <div class="taskProgress progressSlim progressGreen">80</div>
                        </li>

                        <li>
                            <span class="title">招标完成情况</span>
                            <span class="percent"></span>

                            <div class="taskProgress progressSlim progressYellow">20</div>
                        </li>

                        <li>
                            <span class="title">设计图纸完成情况</span>
                            <span class="percent"></span>

                            <div class="taskProgress progressSlim progressBlue">57</div>
                        </li>

                        <li>
                            <span class="title">进场比率</span>
                            <span class="percent"></span>

                            <div class="taskProgress progressSlim progressRed">45</div>
                        </li>

                    </ul>

                </div>


                <div class="tab-pane" id="users">

                    <ul class="users-list">
                        <g:each in="${User.list()}" var="user">
                            <li><a href="#">
                                <span class="status active"></span>
                                <span class="avatar">
                                    <img class="img-circle"
                                         src="<g:createLink controller='user' action='renderAvatar'
                                                            id='${user.username}'/>" alt="">
                                </span>
                                <span class="name">${user.profile}</span></a>
                            </li>
                        </g:each>
                        <li>
                            <a href="#">还有些活跃用户...</a>
                        </li>
                    </ul>
                </div>

                <div class="tab-pane" id="messages">

                    <ul class="messages-list">

                        <g:each in="${MessageRecipient.findAllByRecipient(session.currentUser).collect {it.message}[0..9]}"
                                var="message">
                            <li>
                                <a href="#">
                                    <div class="avatar">
                                        <img class="img-circle"
                                             src="<g:createLink controller='user' action='renderAvatar'
                                                                id='${message.sender?.username}'/>" alt="">
                                    </div>
                                    <span class="name">${message.sender?.profile}</span>
                                    <span class="date"><am:dateFromNow date="${message.dateCreated}"/></span>
                                    <span class="title">${message.title}</span>
                                </a>
                            </li>
                        </g:each>
                        <a href="#">还有不少消息呢...</a>
                    </li>
                    </ul>
                </div>
            </div>
        </div>
        <a id="widgets-area-button" class="hidden-phone open">
            <i class="fa-icon-reorder"></i></a>
    </div>
</div>

<footer>
    <p>
        <span style="text-align:left;float:left">&copy; <a href="" target="_blank">AgileMaster Inc.</a> 2013</span>
        <span class="hidden-phone" style="text-align:right;float:right">Powered by: <a href="#">AgileMaster</a></span>
    </p>

</footer>
<r:script>

    $(function () {

    });

</r:script>

<r:layoutResources/>
</body>
</html>