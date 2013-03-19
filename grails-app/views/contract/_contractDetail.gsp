<div class="message dark">

    <div class="header">
        <h1>TITLE: ${contractInstance?.title}</h1>

        <div class="from"><i class="halflings-icon user"></i> <b>${contractInstance?.partyB}</b></div>

        <div class="date"><i class="halflings-icon time"></i> Today, <b>3:47 PM</b></div>

        <div class="menu">
            <g:link controller="contract" action="addDemoContract">AddDemo</g:link>
            <g:link controller="contract" action="printCurrentUser">PrintUser</g:link>
            <g:link controller="auth" action="signIn">Log in</g:link>
        </div>

    </div>

    <div class="content">
        <p>
            <span class="success">简介</span>
            ${contractInstance?.description}
        </p>

        <p>
            <span class="success">联系人</span>
            ${contractInstance?.contact}
        </p>


    </div>

    <div class="attachments">
        <ul>
            <li>
                <span class="label label-important">zip</span> <b>bootstrap.zip</b> <i>(2,5MB)</i>
                <span class="quickMenu">
                    <a href="#" class="glyphicons search"><i></i></a>
                    <a href="#" class="glyphicons share"><i></i></a>
                    <a href="#" class="glyphicons cloud-download"><i></i></a>
                </span>
            </li>
        </ul>
    </div>
</div>
