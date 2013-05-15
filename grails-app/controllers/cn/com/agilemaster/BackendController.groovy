package cn.com.agilemaster

import grails.converters.JSON
import cn.com.agilemaster.utils.ImportException

/**
 * BackendController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BackendController {

    //  static scaffold = true
    def importService
   // static allowedMethods = [listUsers: 'POST', index: 'GET']

    def index = {
        render view: 'index', model: [users: User.list()]
    }

    def listUsers = {
        render(template: 'user', model: [users: User.list()])
    }

    def showUser = {
        render template: 'showUser', model: [user: User.get(params.id)]
    }

    def postUser = {
        println params
        def results = [sucess: false, msg: 'hahahah']
        render results as JSON
    }

    def ajaxImportLocalWBS = {
        try {
            importService.importLocalWBS('ROOT', '医院建设项目');
            render {
                div(class: 'alert alert-success', '医院建设工作分解导入完成！')
            }
        } catch (ImportException ie) {
            render {
                div(class: 'alert alert-error', ie.message)
            }
        }


    }

    def ajaxImportLocalPBS = {
        try {
            importService.importLocalPBS('ROOT')
            render {
                div(class: 'alert alert-success', '医院建设项目分解导入完成！')
            }
        } catch (ImportException ie) {
            render {
                div(class: 'errors', ie.message)
            }
        }

    }


}
