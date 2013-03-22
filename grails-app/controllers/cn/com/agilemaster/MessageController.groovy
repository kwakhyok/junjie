package cn.com.agilemaster

/**
 * MessageController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class MessageController {

    def index = {
       render(view: 'index')
    }

}
