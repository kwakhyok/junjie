
<ul id="Menu" class="nav nav-pills">
    <li>
        <g:remoteLink action="orgs" update="infoListDiv"><i class="icon-th-list"></i>所有企业类信息</g:remoteLink>
    </li>

    <li>
        <g:remoteLink method="GET" action="orgs" params="[tag: '意愿']" update="infoListDiv"><i
                class="icon-th-list"></i>意向企业</g:remoteLink>
    </li>


    <li>
        <g:remoteLink action="orgs" params="[tag: '投标']" update="infoListDiv"><i
                class="icon-th-list"></i>招标企业</g:remoteLink>
    </li>



    <li>
        <g:remoteLink action="orgs" params="[tag: '参建']" update="infoListDiv"><i
                class="icon-th-list"></i>参建企业</g:remoteLink>
    </li>



    <li>
        <g:remoteLink action="orgs" update="infoListDiv"><i class="icon-th-list"></i>专家库</g:remoteLink>
    </li>



    <li>
        <g:remoteLink action="orgs" update="infoListDiv"><i class="icon-th-list"></i>设计图纸</g:remoteLink>
    </li>

    <li>
        <g:remoteLink action="orgs" update="infoListDiv"><i class="icon-th-list"></i>前期手续</g:remoteLink>
    </li>

    <li>
        <g:remoteLink action="orgs" update="infoListDiv"><i class="icon-th-list"></i>监理信息</g:remoteLink>
    </li>

    <li>
        <g:link controller="organization" action="create"><i class="icon-hdd"></i>新建企业信息</g:link>
    </li>
    <li>
        <g:link controller="task" action="create"><i class="icon-hdd"></i>新建任务</g:link>
    </li>
</ul>
