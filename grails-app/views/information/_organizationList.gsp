<g:set var="tomorrow" value="${new java.util.Date() +1}"/>
<g:set var="orgNo" value="${1..100}"/>
<div class="box span12">
    <div class="box-header" data-original-title>
        <h2><i class="halflings-icon user"></i><span class="break"></span>${tomorrow}</h2>

        <div class="box-icon">
            <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
            <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
            <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
        </div>
    </div>

    <div class="box-content">
        <table class="table table-striped table-bordered bootstrap-datatable datatable">
            <thead>
            <tr>
                <th>名称</th>
                <th>地址</th>
                <th>联系人</th>
                <th>电话</th>
                <th>操作..</th>
            </tr>
            </thead>
            <tbody>
               <g:each in="${orgNo}" var="i">
                   <tr>
                       <td>${i}</td>
                       <td>${i}</td>
                       <td>${i}</td>
                       <td>${i}</td>
                       <td>${i}</td>
                   </tr>
               </g:each>
            </tbody>
        </table>
    </div>
</div>