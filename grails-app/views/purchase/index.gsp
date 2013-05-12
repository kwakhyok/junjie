<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
    <title>${meta(name: 'app.name')} -- 采购（招投标）管理</title>
    <meta content="main" name="layout"/>
    <r:require module="acme"/>
</head>

<body>
<div class="row-fluid">
    <div class="btn-group">
        <button class="btn btn-large">查看所有标段</button>
        <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <g:each in="${(1..10)}" var="bid">
                <li><a href="#"><i class="halflings-icon star"></i><span class="break"></span> ${bid}</a></li>
            </g:each>
        </ul>
    </div>
</div>
<hr>

<div class="row-fluid sortable">
    <div class="span12">
        <div class="box-header">
            <h2><i class="halflings-icon th"></i><span class="break"></span>${bidSection?.title}</h2>
        </div>

        <div class="box-content">
            <ul class="nav tab-menu nav-tabs" id="myTab">
                <li class="active"><a href="#intentionOrg">意向企业</a></li>
                <li><a href="#bidOrg">投标企业</a></li>
                <li><a href="#designOrg">设计单位</a></li>
                <li><a href="#participation">参建单位</a></li>
                <li><a href="#assessment">评标</a></li>
                <li><a href="#anounce">唱标</a></li>

            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active" id="intentionOrg">
                    <h1>Intention</h1>
                </div>

                <div class="tab-pane" id="bidOrg">
                    <h1>bid</h1>
                </div>

                <div class="tab-pane" id="designOrg">
                    <h1>design</h1>
                </div>

                <div class="tab-pane" id="participation">
                    <h1>parti</h1>
                </div>

                <div class="tab-pane" id="anounce">
                    <h1>唱</h1>

                    <p>
                    <ul>
                        <li>唱标内容只唱投标方名称、投标设备（材料、方案）、投标报价、折扣系数和交货期（完成时间），每标只唱两遍。</li>
                        <li>在唱标中，投标人认为有不清楚的地方，请在唱标后经主持人同意立即提出。</li>
                        <li>投标报价的总价如果有疑义，以分项报价的合计为准。</li>

                    </ul>
                    以上内容客观上规定了唱标要做到最基本的两点，那就是准确性和严肃性。
                </p>
                </div>

                <div class="tab-pane" id="assessment">
                    <h1>评</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row-fluid sortable">
    <am:boxContainer icon="list" span="4" canFold='true' title="签到表">签到</am:boxContainer>
    <am:boxContainer icon="list" span="4" canFold='true' title="专家评分">专家评分</am:boxContainer>
    <am:boxContainer icon="list" span="4" canFold='true' title="记录唱标">记录唱标</am:boxContainer>
</div>

<div class="row-fluid sortable">
    <am:boxContainer icon="list" span="4" canFold='true' title="资格审查">资格审查</am:boxContainer>
    <am:boxContainer icon="list" span="4" canFold='true' title="符合审查">符合审查</am:boxContainer>
    <am:boxContainer icon="list" span="4" canFold='true' title="综合评分">综合评分</am:boxContainer>
</div>

</body>
</html>