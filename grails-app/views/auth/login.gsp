<!DOCTYPE html>

<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta content="acm" name="layout"/>
    <r:require module="acme"/>
    <style type="text/css">
    body {
        background: url("${createLinkTo(dir:'acm/img', file:'bg-login.jpg')}") !important;
    }
    </style>
    <title>君捷项目管理系统 -- 登录</title>
</head>

<body>

<div class="container-fluid">
    <div class="row-fluid">

        <div class="row-fluid">
            <div class="login-box">
                <div class="icons">
                    <a href="#"><i class="halflings-icon home"></i></a>
                    <a href="#"><i class="halflings-icon cog"></i></a>
                </div>

                <h2>登录君捷项目管理系统 - 1.2</h2>

                <g:if test="${flash.message}">
                    <div class="message alert alert-block">${flash.message}</div>
                </g:if>


                <form class="form-horizontal" action="signIn" method="post">
                    <fieldset>
                        <input type="hidden" name="targetUri" value="${targetUri}"/>

                        <div class="input-prepend" title="用户名">
                            <span class="add-on"><i class="halflings-icon user"></i></span>
                            <input class="input-large span10" name="username" id="username" type="text"
                                   placeholder="请键入用户名" value="${username}"/>
                        </div>

                        <div class="clearfix"></div>

                        <div class="input-prepend" title="密码">
                            <span class="add-on"><i class="halflings-icon lock"></i></span>
                            <input class="input-large span10" name="password" id="password" type="password"
                                   placeholder="请键入密码" value=""/>
                        </div>

                        <div class="clearfix"></div>

                        <label class="remember" for="remember"><input type="checkbox" id="remember"
                                                                      value="${rememberMe}"/>记住我</label>

                        <div class="button-login">
                            <button type="submit" class="btn btn-primary">登录</button>
                        </div>

                        <div class="clearfix"></div>
                    </fieldset>
                </form>
                <hr>

                <h3>演示提示</h3>
                <p>
                    管理员用户：admin
                </p>
                <p>
                    密码: password
                </p>
                <p>
                    操作员：test
                </p>
                <p>
                    密码：password
                </p>
            </div><!--/span-->
        </div><!--/row-->

    </div><!--/fluid-row-->

</div><!--/.fluid-container-->

</body>
</html>
