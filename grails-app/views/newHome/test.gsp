<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-1-16
  Time: PM10:57
  To change this template use File | Settings | File Templates.
--%>



<html>

<head>
    <title><g:message code="default.welcome.title" args="[meta(name: 'app.name')]"/></title>
    <meta name="layout" content="kickstart"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'jsgantt.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'junjie.css')}"/>
    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'jsgantt.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'RGraph.common.core.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'RGraph.common.dynamic.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'RGraph.common.key.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'RGraph.common.tooltips.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'RGraph.vprogress.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'RGraph.funnel.js')}"></script>
</head>

<body>
<content tag="header">
 <br/><br/>
</content>
<section id="intro" class="first">
    <g:render template="/templates/jsgantt"/>
</section>

<section id="info">
  <div class="dashboardWrap">
      <ul>
          <li>
              <h3 class="noMargin">采购</h3>
              <div class="pull-right">
                 <g:render template="/templates/hprogress" model="[canvasId:'canvasId1']"/>
                 <p>采购进度目前需要领导跟进</p>
              </div>
          </li>

          <li>
              <h3 class="noMargin">合同</h3>
              <div class="pull-right">
                  <g:render template="/templates/hprogress" model="[canvasId:'canvasId2']"/>
                  <p>合同需要领导跟进，xx合同进程滞后！</p>
              </div>
          </li>

          <li>
              <h3 class="noMargin">投资</h3>
              <div class="pull-right">
                  <g:render template="/templates/hprogress" model="[canvasId:'canvasId3']"/>
                  <p>投资需要领导跟进，xx投资额度没有进账！</p>
              </div>
          </li>

          <li>
              <h3 class="noMargin">设计</h3>
              <div class="pull-right">
                  <g:render template="/templates/hprogress" model="[canvasId:'canvasId4']"/>
                  <p>设计需要领导跟进，氧气室设计滞后！</p>
              </div>
          </li>

      </ul>
  </div>
</section>
<section id="info2">

</section>
</body>
</html>
