package cn.com.agilemaster

import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.converters.JSON

/**
 * MessageController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class MessageController {

    static scaffold = true

    def index = {
        render(view: 'index')
    }


    def renderMessageForUser = {

    }

    def create = {
        render template: 'newMessage'
    }

    def sendAndSave = {

        def user = session.currentUser
        def msg = new Message(title: params.title, body: params.body,
                sender: user, tag: params.tag, uploadedFile: params.uploadedFile)
        def recipients = params.recipients.split(',')
        recipients.each { recipient ->
            msg.addToRecipients(new MessageRecipient(message: msg, recipient: User.findByUsername(recipient)))
        }
        if (msg.save(failOnError: true)) {
            redirect(action: 'index')
        } else {
            msg.errors.each {println it}
        }
    }

    def reply = {

    }

    def ajaxReply = {
        def jsonMap = [:]
        if(params.msgId){
           def mainMsg = Message.get(params.msgId)
           jsonMap.put('title', "RE:" + mainMsg.title)
           jsonMap.put('mainBody', mainMsg.body)
           jsonMap.put('reply', mainMsg.sender)
           jsonMap.put('sender', session.currentUser)
           //TODO render main messages Files
        }

        render jsonMap as JSON
    }

    def forward = {

    }

    def ajaxForward = {
        def jsonMap = [:]
        //TODO render main messages in Forward
        render jsonMap as JSON
    }
}
