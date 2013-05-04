<tr class="messagesListRow">
    <td>
        <div class="checker">
            <span><input type="checkbox"></span>
        </div>
    </td>
    <td class="from ">
        <span class="glyphicons dislikes"><i></i></span>
        ${message.sender?.profile}
        <g:if test="${message?.uploadedFile?.size() > 0}">
            <span class="glyphicons paperclip"><i></i></span>
        </g:if>
    </td>
    <td class=" ">
        <am:messageTagLabel tags="${message.tags}"/>
        ${message.title}
    </td>
    <td class="date ">
        <am:dateFromNow date="${message.dateCreated}"/>
    </td>
    <td class=" ">
        <a href="#" class="replyBtn label label-info">回复</a>
        <a href="#" class="forwardBtn label label-success">转发</a>
    </td>
</tr>