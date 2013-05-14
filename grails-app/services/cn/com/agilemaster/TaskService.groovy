package cn.com.agilemaster

import org.codehaus.groovy.grails.commons.ApplicationHolder as AH

/**
 * TaskService
 * A service class encapsulates the core business logic of a Grails application
 */
class TaskService {

    def userService

    static transactional = true

    private User getCurrentUser() {
        userService.getCurrentUser()
    }

    def planTask(def taskId, Map properties) {
        def task = Task.get(taskId)
        if (task) {
            def plan = new TaskPlan(
                    startDate: properties.startDate,
                    endDate: properties.endDate,
                    completeRatio: 0.0f,
                    author: getCurrentUser()
            )
            //plan.properties = properties
            task.currentPlan = plan
            plan.save(flush: true)
        } else {
            log.error("Task with taskId: ${taskId} was not found")
        }

    }

    private Map mappingTask(aTask) {
        def map = [:]
        map['code'] = aTask.code
        map['title'] = aTask.title
        map['description'] = aTask.description
        map['startDate'] = aTask.currentPlan?.startDate
        map['endDate'] = aTask.currentPlan?.endDate
        map['assignedUser'] = aTask.currentPlan?.assignedUser?.profile?.toString()
        map['photo'] = aTask.currentPlan?.assignedUser?.profile?.photo
        return map
    }

    def listTasksAsJson(project) {
        def tasks = Task.findAllByProjectAndParentTask(project, null, [sort: 'code']);
        def prjTaskList = []
        tasks.each { aTask ->
            if (!aTask.parentTask && aTask.code.lastIndexOf('.') < 0) {
                def taskMap = mappingTask(aTask)
                def taskList = []
                aTask.subTasks?.each { sTask ->
                    def subTaskMap = mappingTask(sTask)
                    def subTaskList = []
                    sTask.subTasks?.each { ssTask ->
                        def ssTaskMap = mappingTask(ssTask)
                        def ssTaskList = []
                        ssTask.subTasks.each {sssTask ->
                            def sssTaskMap = mappingTask(sssTask)
                            ssTaskList.add(sssTaskMap)
                        }
                        ssTaskMap['subTasks'] = ssTaskList
                        subTaskList.add(ssTaskMap)
                    }
                    subTaskMap['subTasks'] = subTaskList
                    taskList.add(subTaskMap)
                }
                taskMap['subTasks'] = taskList
                prjTaskList.add(taskMap)
            }
        }
        def jsonMap = [:]
        jsonMap['id'] = project.id
        jsonMap['code'] = project.code
        jsonMap['title'] = project.name
        jsonMap['description'] = project.description
        jsonMap['subTasks'] = prjTaskList
        return jsonMap
    }




    def deleteTask(def taskId) {
        Task.get(taskId).delete()
    }


    List<Task> getLastTaskList() {
        def lastWork
        lastWork = Workbreakdown.list(max: 1, sort: "code", order: "desc").get(0)
        return lastWork?.tasks?.sort {it.code}
    }


    def getTasksByCurrentUser() {
        //  def tasks = []
        def currentUser =

            TaskPlan.findAllByAssignedUser(getCurrentUser()).collect {it.task}.unique()


    }

    def findAllTasksByPriority(priority) {
        return TaskPlan.findAllByPriority(priority).collect {it.task}
    }



    def planLastDemoTasks(wbsId) {
        def today = new Date()
        def wbs = Workbreakdown.findByCode(wbsId)
        def tasks = wbs?.rootProject?.tasks
        if (tasks) {
            def priorities = ['high', 'medium', 'low']
            def before = [3, 4, 5, 6, 7, 8, 9, 10]
            def after = [3, 4, 5, 6, 7, 28, 9, 10]
            def ratios = [0.0, 18.0, 20.0, 37.0, 85.0, 90.0, 50.0, 40.0]
            if (tasks.size() > 0) {
                tasks.eachWithIndex { task, i ->

                    Collections.shuffle(before)
                    Collections.shuffle(after)
                    Collections.shuffle(ratios)
                    Collections.shuffle(priorities)

                    def bDiff = before.get(0)
                    def aDiff = after.get(0)
                    def ratio = ratios.get(0)
                    def priority = priorities.get(0)

                    def randomUser = User.list().getAt(i % 6)

                    def randomProperties = [startDate: today - bDiff,
                            endDate: today + aDiff, completeRatio: ratio,
                            assignedUser: randomUser,
                            author: userService.getCurrentUser(),
                            participants: userService.getTwoRandomUsers(),
                            priority: priority]


                    def newPlan = task.currentPlan ?: new TaskPlan(randomProperties)
                    newPlan.task = task
                    newPlan.save(failOnError: true, flush: true)
                    task.status = 'planned'
                    task.currentPlan = newPlan
                    task.save(failOnError: true, flush: true)
                }
            }
            wbs.status = 'on-progress'
            wbs.save(failOnError: true)
        }
    }


}
