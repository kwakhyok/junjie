<%--
  Created by IntelliJ IDEA.
  User: guo
  Date: 13-3-14
  Time: AM10:51
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>君捷软件</title>


<body>
         <h1>Gallery</h1>

       <div id="my-folio-of-works" class="svwp">
           <ul>
               <li><img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" alt="病房楼工程进度"
                        height="490"/></li>
               <li><img src="${createLinkTo(dir: 'img/pics', file: '2.jpg')}" alt="地下车库工程进度"
                        height="490"/></li>
               <li><img src="${createLinkTo(dir: 'img/pics', file: '3.jpg')}" alt="门诊楼工程进度"
                        height="490"/></li>
           </ul>
       </div>


</body>

</html>