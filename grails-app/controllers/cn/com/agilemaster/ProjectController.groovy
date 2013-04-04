package cn.com.agilemaster

import grails.converters.JSON

/**
 * ProjectController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ProjectController {

    static scaffold = true

	def index = {
        def taskList = []
        if(params.id)
            taskList = Task.findAllByProject(Project.get(params.id))
        else{
            taskList = Task.findAll()
        }
        [taskList : taskList, total: taskList?.size()]
    }

    def listAsJson = {
        def fcal = Calendar.getInstance()
        if (params.start)
            fcal.setTime(new Date(Long.parseLong(params.start)))
        def lcal = Calendar.getInstance()
        if (params.end)
            lcal.setTime(new Date(Long.parseLong(params.end)))
        def listOfTasks = Task.findAll("from Task as t where t.startDate>:startDate AND t.endDate <:endDate",
                [startDate:fcal.getTime(), endDate: lcal.getTime()])

        def listOfJsTasks = []
        listOfTasks.each{ task ->
            def jsTask = [:]
            jsTask.id = task.id
            jsTask.name = task.title
            jsTask.title = task.description?.length()>15? task.description.substring(0,14)+"..." :task.title
            jsTask.description = task.description
            jsTask.start = task.startDate
            jsTask.end = task.endDate
            jsTask.showTime = true
            jsTask.url = "show?id=${task.id}"
            jsTask.className="scheduled"
            jsTask.allDay = true
            listOfJsTasks.add(jsTask)

        }

        render listOfJsTasks as JSON

    }
}
