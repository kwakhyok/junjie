package cn.com.agilemaster

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

/**
 * TaskController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class TaskController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", planTaskAjax: "GET"]

    static ajaxify = ['test']

    def taskService


    def index() {
        def works = Workbreakdown.list(params)
        def pbss = Projectbreakdown.list(params)
        /** TODO: analyze the workbreakdown's status **/
        /*works.each { work ->
            def wstatus = 0  // 0:processing, 1:completed
            work.tasks?.each { wtask ->
                if (wtask.status != 'archived') {
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
                if (ptask.status != 'archived') {
                    pstatus = 0
                } else {
                    pstatus = 1
                }
            }
            pbs.metaClass.status = pstatus
        }
        */
        def tasks = taskService.getLastTaskList()

        def myTasks = taskService.getTasksByCurrentUser()

        [WBSList: works, PBSList: pbss, taskList: tasks, myTaskList: myTasks]
    }
    def test(){
       // TODO: ajax edit task and assign tasks
    }



    def planTask = {
        def taskId = params?.taskId
        if(taskId){
            taskService.planTask(taskId, params)
        }else{
            flash.message = 'Task was not found!'
        }
    }

    def planTaskAjax = {
        def task = Task.get(params.taskId)
       if(task){
          render (template: 'modals/taskModal',model:[task:task])
       }else{
           render Task.get(1) as JSON
       }
    }


    def addDemoPlan = {
        taskService.planLastDemoTasks(params.id)
        //redirect(action: 'index')
    }



    def deleteTask = {
        taskService.deleteTask(params.taskId)
        flash.message = "任务 ${params.taskId} 被删除"
    }


    def ajaxListTasks() {
        def wbsId = params?.wbsId
        def wbs
        if (wbsId){
            wbs = Workbreakdown.get(wbsId);

        }else{
           //wbs = Workbreakdown.find("from Workbreakdown as wbs order by wbs.dateCreated asc")
            wbs = Workbreakdown.list(max: 1, sort: "code", order: "desc").get(0)
        }
        def tasks = wbs?.tasks?.sort{it.code}
        render(template: 'taskList', model: [taskList:tasks])
    }


    def ajaxListTasksPBS(){
        def pbsId = params?.pbsId
        def pbs
        if (pbsId){
            pbs = Projectbreakdown.get(pbsId)
        }else{
            pbs = Projectbreakdown.find(true)
        }
        def tasks = pbs?.tasks?.sort{it.code}
        render(template:'taskList', model: [taskList: tasks])


    }

    def editAjax(){

    }


    def planTaskSave = {

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
