package cn.com.agilemaster

/**
 * NewHomeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class NewHomeController {
    def userService
    def taskService

    def index = {
        render(view: "index")
    }

    def test = {
        render(view: "test")
    }

    def newindex = {
        def currentUser = session.currentUser
        if (currentUser) {
            def myTasks = taskService.getTasksByCurrentUser()
            def msgs = MessageRecipient.findAllByRecipient(currentUser)?.collect{it.message}
            // render(view:'newindex', model: [taskList:myTasks])
            render(view: 'newindex', model: [messages:msgs])
        }
        else {
            render 'no user found'
        }
    }


    def home = {
        render(view: 'home')
    }

}
