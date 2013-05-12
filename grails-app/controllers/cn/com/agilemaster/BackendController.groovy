package cn.com.agilemaster

import grails.converters.JSON

/**
 * BackendController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BackendController {

  //  static scaffold = true
    def importService
    static allowedMethods = [listUsers: 'POST', index:'GET']

	def index = {
        render view:'index', model: [ users: User.list()]
    }

    def listUsers = {
        render (template: 'user', model: [users:  User.list()])
    }

    def showUser = {
       render template: 'showUser', model: [user: User.get(params.id)]
    }

    def postUser = {
        println params
        def results = [sucess: false, msg:'hahahah']
        render results as JSON
    }


    def importFromLocalDefaultFile = {
        importService.importLocalWBS('ROOT')
        redirect(action: 'index')
    }

}
