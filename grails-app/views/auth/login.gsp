<!DOCTYPE html>

<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta content="acm" name="layout"/>
    <!-- start: Favicon -->
    <link rel="shortcut icon" href="${createLinkTo(dir: 'acm/img', file: 'favicon.ico')}"/>
    <!-- end: Favicon -->
    <r:require module="acm"/>
    <style type="text/css">
    body {
        background: url("${createLinkTo(dir:'acm/img', file:'bg-login.jpg')}") !important;
    }
    </style>
    <title>君捷项目管理系统 -- 登录</title>
</head>


<body>

<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>

<div class="container-fluid">
    <div class="row-fluid">

        <div class="row-fluid">
            <div class="login-box">
                <div class="icons">
                    <a href="#"><i class="halflings-icon home"></i></a>
                    <a href="#"><i class="halflings-icon cog"></i></a>
                </div>

                <h2>登录君捷项目管理系统 - 1.2</h2>

                <form class="form-horizontal" action="signIn" method="post">
                    <fieldset>
                        <input type="hidden" name="targetUri" value="${targetUri}"/>

                        <div class="input-prepend" title="<g:message code="junjie.user" default="Username"/>">
                            <span class="add-on"><i class="halflings-icon user"></i></span>
                            <input class="input-large span10" name="username" id="username" type="text"
                                   placeholder="type username" value="${username}"/>
                        </div>

                        <div class="clearfix"></div>

                        <div class="input-prepend" title="<g:message code="junjie.password"/>">
                            <span class="add-on"><i class="halflings-icon lock"></i></span>
                            <input class="input-large span10" name="password" id="password" type="password"
                                   placeholder="type password" value=""/>
                        </div>

                        <div class="clearfix"></div>

                        <label class="remember" for="remember"><input type="checkbox" id="remember"
                                                                      value="${rememberMe}"/><g:message
                                code="junjie.rememberMe"/></label>

                        <div class="button-login">
                            <button type="submit" class="btn btn-primary"><g:message code="junjie.login"/></button>
                        </div>

                        <div class="clearfix"></div>
                    </fieldset>
                </form>
                <hr>

                <h3>演示提示</h3>
                <p>
                    初始管理员: admin: [password]
                </p>
                <p>
                    初始操作员：test: [password]
                </p>
            </div><!--/span-->
        </div><!--/row-->

    </div><!--/fluid-row-->

</div><!--/.fluid-container-->

</body>
</html>
