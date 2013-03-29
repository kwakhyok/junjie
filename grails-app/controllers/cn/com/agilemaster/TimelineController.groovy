package cn.com.agilemaster

/**
 * TimelineController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class TimelineController {

    def taskService

    def index = {


        render (view: 'timeline')
    }
}
