<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} | 施工管理</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
</head>

<body>
    <div class="row-fluid sortable">
        <am:boxContainer span="4" canFold="true" title="进场公司列表" icon="list">
            <h2>进场</h2>
        </am:boxContainer>
        <am:boxContainer span="4" canFold="true" title="公司进度" icon="list">
            <h2>进场</h2>
        </am:boxContainer>
        <am:boxContainer span="4" canFold="true" title="公司进度" icon="list">
            <h2>进场</h2>
        </am:boxContainer>
    </div>
</body>

</html>