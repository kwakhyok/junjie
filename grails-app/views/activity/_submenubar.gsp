<div class="row">
    <div class="span12">
        <ul id="Menu" class="nav nav-pills">
            <li class="${params.action=="batchAddDemoActivities"?'active': ''}">
                <g:link action="batchAddDemoActivities"><i class="icon-tags"></i>BatchAddActivities</g:link>
            </li>

            <li class="${params.action=="batchAddOrganizations"?'active': ''}">
                <g:link action="batchAddOrganizations"><i class="icon-tags"></i>batchAddOrganizations</g:link>
            </li>

            <li class="${params.action=="batchAddTasks"?'active': ''}">
                <g:link action="batchAddTasks"><i class="icon-tags"></i>batchAddTasks</g:link>
            </li>

        </ul>
    </div>
</div>
