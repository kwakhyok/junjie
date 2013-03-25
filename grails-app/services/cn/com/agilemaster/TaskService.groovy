package cn.com.agilemaster

/**
 * TaskService
 * A service class encapsulates the core business logic of a Grails application
 */
class TaskService {

    def userService

    static transactional = true

    def planTask(def taskId, Map properties) {
        def task = Task.get(taskId)
        if (task) {
            def plan = new TaskPlan(
                    startDate: properties.startDate,
                    endDate: properties.endDate,
                    completeRatio: 0.0f,
                    author: userService.getCurrentUser()
            )
            //plan.properties = properties
            task.addToPlans(plan).save(failOnError: true)
        } else {
            log.error("Task with taskId: ${taskId} was not found")
        }

    }


    def upTask(def taskId) {

    }

    def downTask(def taskId) {

    }

    def deleteTask(def taskId) {
        Task.get(taskId).delete()
    }


    List<Task> getLastTaskList() {
        def lastWork
        if (Workbreakdown.count > 0) {
            lastWork = Workbreakdown.list(max: 1, sort: "code", order: "desc").get(0)
            return lastWork.tasks.sort {it.code}
        }

        else {
            log.debug('No workbreakdown found')
            return []
        }
    }

    def planLastDemoTasks() {
        def today = new Date()
        def tasks = this.getLastTaskList()
        if (tasks.size() > 0) {
            tasks.each { task ->
                task.addToPlans(new TaskPlan(startDate: today - 7,
                        endDate: today + 14, completeRatio: 0.0f,
                        assignedUser: userService.getCurrentUser(),
                        author: userService.getCurrentUser()))
                task.status='planned'
                task.save(failOnError: true)
            }
        }
    }

/* create demo WBS and PBS */

    def createWbsAndPbs() {
        def prjName = "滨州医学院烟台附属医院项目"
        def prj = Project.findByName(prjName) ?: new Project(name: prjName, description: '项目的简单描述',
                author: userService.getCurrentUser()).save(failOnError: true)
        if (!Workbreakdown.count > 0) {
            //WBS demo
            (1..5).each { j ->
                def wbs = new Workbreakdown(code: j.toString(), title: "201${j}度").save(failOnError: true)
                (1..3).each {i ->
                    wbs.addToTasks(new Task(project: prj,
                            title: "DemoTask${i}",
                            code: "${j}.${i}",
                            status: "drafted").save(failOnError: true))
                }
            }
        }
        if (!Projectbreakdown.count > 0) {
            //PBS Demo
            (1..5).each { j ->
                def pbs = new Projectbreakdown(code: j.toString(), title: "201${j}度", project: prj).save(failOnError: true)
                (1..6).each {i ->
                    pbs.addToTasks(new Task(project: prj,
                            title: "ProjectDemoTask${i}",
                            code: "${j}.${i}",
                            status: "drafted").save(failOnError: true))
                }
            }
        }


    }

}
