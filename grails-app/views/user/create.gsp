<!DOCTYPE html>

<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta content="main" name="layout"/>
    <!-- start: Favicon -->
    <link rel="shortcut icon" href="${createLinkTo(dir: 'acm/img', file: 'favicon.ico')}"/>
    <!-- end: Favicon -->
    <r:require module="acme"/>
    <style type="text/css">

    .control-label-small {
        float:left;
        width:100px;
        padding-top:5px;
        text-align:right;
    }
    </style>
    <title>君捷项目管理系统 -- 新建用户</title>
</head>


<body>

<div class="row-fluid sortable">

    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon edit"></i><span class="break"></span>君捷项目管理系统 -- 新建用户</h2>

            <div class="box-icon">
                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
            </div>
        </div>

        <div class="box-content">

             <!-- errors and messages -->

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${userDetails}">
                <div class="errors">
                    <g:renderErrors bean="${userDetails}" as="list"/>
                </div>
            </g:hasErrors>

            <form class="form-horizontal" action="create" method="post">
                <fieldset>

                    <div class="control-group">
                        <div class="input-prepend" title="<g:message code="junjie.user" default="Username"/>">

                            <span class="add-on"><i class="halflings-icon user"></i></span>
                            <input class="input-large span12" placeholder="请输入用户名..." name="username"
                                   type="text">
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="control-group">
                        <div class="input-prepend" title="<g:message code="junjie.password"/>">
                            <span class="add-on"><i class="halflings-icon lock"></i></span>
                            <input class="input-xlarge span12" name="password" type="password"
                                   placeholder="键入密码..." value=""/>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="control-group">
                        <div class="input-prepend" title="<g:message code="junjie.password"/>">
                            <span class="add-on"><i class="halflings-icon lock"></i></span>
                            <input class="input-xlarge span12" name="passwordRepeat" type="password"
                                   placeholder="再次键入密码..." value=""/>
                        </div>
                    </div>

                    <hr/>

                    <h2><span class="break"></span>用户资料</h2>

                    <div class="row-fluid">
                        <div class="span6">

                            <div class="control-group">
                                <label class="control-label" for="lastName">姓</label>

                                <div class="controls">
                                    <input class="input-xlarge focused" id="lastName" name="lastName" type="text"
                                           placeholder="您叫嘛?...">
                                </div>

                            </div>


                            <div class="control-group">
                                <label class="control-label" for="telephone">电话</label>
                                <div class="controls">
                                    <input class="input-xlarge" id="telephone" name="telephone" type="text" placeholder="您电话号码？...">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="email">电子邮箱</label>
                                <div class="controls">
                                    <input class="input-xlarge" id="email" name="email" type="text" placeholder="您邮箱？...">
                                </div>
                            </div>


                        </div>
                        <div class="span6">
                            <div class="control-group">

                                <label class="control-label" for="firstName">名</label>
                                <div class="controls">
                                    <input class="input-xlarge" id="firstName" name="firstName" type="text"
                                           placeholder="您姓嘛?...">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label"  for="fax">传真</label>
                                <div class="controls">
                                    <input class="input-xlarge" id="fax" name="fax" type="text" placeholder="传真...">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="photo">照片</label>
                        <div class="controls">
                            <input class="input-file uniform_on" id="photo" name=photo type="file">
                        </div>
                    </div>

                    <div class="control-group hidden-phone">
                        <label class="control-label" for="memo">个人简介</label>
                        <div class="controls">
                            <textarea class="cleditor" id="memo" name="memo" rows="3"></textarea>
                        </div>
                    </div>
                </fieldset>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">保存</button>
                    <button type="reset" class="btn">取消</button>
                </div>

            </form>

        </div> <!--/box-content-->

    </div>

</div>

</body>
</html>
