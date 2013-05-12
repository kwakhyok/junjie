<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 12-12-29
  Time: PM4:12
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>君捷项目管理</title>
    <meta content="main" name="layout"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'jsgantt.css')}"/>

    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'jsgantt.js')}"/>

</head>

<body>
<content tag="header">
   <header id="Header" class="jumbotron" >
       <div class="inner">
           <div class="container">

           </div>
       </div>
   </header>
</content>
<section id="ganttarea" class="first">
    <g:render template="/templates/jsgantt"/>
</section>
<section id="list" style="padding-top: 0">
    <div class="row-fluid">
        <div class="span6">
            <div class="center">
                <h3>设计</h3>
                <g:render template="/templates/vprogress"/>
            </div>
            <p></p>

        </div>
        <div class="span6">
             <div class="center">
                 <h3>Task List</h3>
             </div>
            %{-- <g:render template="/templates/tasklist" model="['taskList':taskList, 'taskTotal': total]"/>--}%
        </div>
    </div>
</section>

</body>

</html>