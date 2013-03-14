package cn.com.agilemaster

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.scheduling.TaskScheduler
import grails.converters.JSON

/**
 * TaskController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class TaskController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static ajaxify = ['test']

    def index() {
        def works = Workbreakdown.list(params)
        def pbss = Projectbreakdown.list(params)

        works.each { work ->
            def wstatus = 0  // 0:processing, 1:completed
            work.tasks?.each { wtask ->
                if (wtask.status != 'completed') {
                    wstatus = 0
                } else {
                    wstatus = 1
                }
            }
            work.metaClass.status = wstatus
        }

        pbss.each { pbs ->
            def pstatus =0  // 0:processing, 1:completed
            pbs.tasks?.each { ptask ->
                if (ptask.status != 'completed') {
                    pstatus = 0
                } else {
                    pstatus = 1
                }
            }
            pbs.metaClass.status = pstatus
        }

        [WBSList: works, PBSList: pbss]
    }
    def test(){

    }



    def ajaxListTasks() {
        def wbsId = params?.wbsId
        def wbs
        if (wbsId){
            wbs = Workbreakdown.get(wbsId);

        }else{
           wbs = Workbreakdown.find("from Workbreakdown as wbs order by wbs.dateCreated asc")
        }

        def tasks = wbs.tasks.sort{it.code}

        render(template: 'taskList', model: [taskList:tasks])

    }

    def editAjax(){

    }

    /********************  below is scaffolding codes ***************************************************/
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [taskInstanceList: Task.list(params), taskInstanceTotal: Task.count()]
    }

    def create() {
        [taskInstance: new Task(params)]
    }

    def save() {
        def taskInstance = new Task(params)
        if (!taskInstance.save(flush: true)) {
            render(view: "create", model: [taskInstance: taskInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(action: "show", id: taskInstance.id)
    }

    def show() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def edit() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def update() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (taskInstance.version > version) {
                taskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'task.label', default: 'Task')] as Object[],
                        "Another user has updated this Task while you were editing")
                render(view: "edit", model: [taskInstance: taskInstance])
                return
            }
        }

        taskInstance.properties = params

        if (!taskInstance.save(flush: true)) {
            render(view: "edit", model: [taskInstance: taskInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(action: "show", id: taskInstance.id)
    }

    def delete() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        try {
            taskInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    /*****************************************************************************
     *
     *
     *
     * */

    def listAsJson = {
        def listOfTasks = Task.list()
        def listOfGanttTasks = []
        listOfTasks.each {task ->
            def ganttTask = [:]

        }

        render listOfTasks as JSON
    }

}
