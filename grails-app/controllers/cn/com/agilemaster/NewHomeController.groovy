package cn.com.agilemaster

/**
 * NewHomeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class NewHomeController {
    def userService
    def taskService

    def newindex = {
        def currentUser = session.currentUser
        if (currentUser) {
            def msgs = MessageRecipient.findAllByRecipient(currentUser)?.collect{it.message}
            // render(view:'newindex', model: [taskList:myTasks])
            render(view: 'newindex', model: [messages:msgs])
        }
        else {
            render 'no user found'
        }
    }
}
