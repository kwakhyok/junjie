package cn.com.agilemaster

import org.springframework.web.multipart.commons.CommonsMultipartFile

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
        render(template: 'newMessage')
    }
}
