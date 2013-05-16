<div class="message dark" style="margin-top: 20px;margin-right: 20px">

    <div class="header">
        <h1>${contractInstance?.title}</h1>

        <div class="from"><i class="halflings-icon user"></i> <b>${contractInstance?.partyB}</b></div>

        <div class="date"><i class="halflings-icon time"></i> Today, <b>3:47 PM</b></div>
        <hr>
        <div class="menu">
            <g:link class="btn btn-mini" controller="contract" action="addDemoContract">AddDemo</g:link>
            <g:link  class="btn btn-mini" controller="auth" action="signIn">Log in</g:link>
        </div>

    </div>

    <div class="content">
        <p>
            <span class="label label-success">简介</span>
            ${contractInstance?.description}
        </p>

        <p>
            <span class="label label-success">联系人</span>
            ${contractInstance?.contact}
        </p>


    </div>

    <div class="attachments">
        <ul>
            <li>
                <span class="label label-important">zip</span> <b>合同正文.zip</b> <i>(2,5MB)</i>
                <span class="quickMenu">
                    <a href="#" class="glyphicons search"><i></i></a>
                    <a href="#" class="glyphicons share"><i></i></a>
                    <a href="#" class="glyphicons cloud-download"><i></i></a>
                </span>
            </li>
        </ul>
    </div>

    <div class="remarks">
        <form class="replyForm"method="post" action="">

            <fieldset>
                <textarea tabindex="3" class="input-xlarge span12 cleditor" id="message" name="body" rows="12"
                          placeholder="签订中总结的问题..."></textarea>

                <div class="actions">

                    <button tabindex="3" type="submit" class="btn btn-primary">提交 </button>

                </div>

            </fieldset>

        </form>
    </div>

</div>
