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
            task.currentPlan = plan
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


    def getTasksByCurrentUser(){
        def tasks = []
         def currentUser = userService.getCurrentUser()
         def plans = TaskPlan.findAllByAssignedUser(currentUser)
         plans.each{ plan ->
             tasks << plan.task
         }
        return tasks.unique()
    }


    def findAllTasksByPriority(priority){

        return TaskPlan.findAllByPriority(priority).collect{it.task}
    }



    def planLastDemoTasks() {
        def today = new Date()
        def tasks = this.getLastTaskList()
        def priorities = ['high','medium','low']
        def before = [3,4,5,6,7,8,9,10]
        def after = [3,4,5,6,7,28,9,10]
        def ratios = [0.0,18.0,20.0,37.0,85.0,90.0,50.0,40.0]
        if (tasks.size() > 0) {
            tasks.each { task ->
                Collections.shuffle(before)
                Collections.shuffle(after)
                Collections.shuffle(ratios)
                Collections.shuffle(priorities)
                def bDiff = before.get(0)
                def aDiff = after.get(0)
                def ratio =ratios.get(0)
                def priority = priorities.get(0)
                def newPlan = new TaskPlan(startDate: today - bDiff,
                        endDate: today + aDiff, completeRatio: ratio,
                        assignedUser: userService.getCurrentUser(),
                        author: userService.getCurrentUser(),
                        priority: priority)
                task.addToPlans(newPlan)
                task.status='planned'
                task.currentPlan = newPlan
                task.save(failOnError: true)
            }
        }
    }

    def recordTaskStatus(task, ratio){
        def plan = task?.currentPlan
        if(plan){
            plan.completeRatio = ratio
            plan.save(failOnError: true)
        }
    }

    def recordAllTaskStatus(){
        def startShuffle = [1..100]
        def endShuffle = [0..80]
        def date = new Date()

        Workbreakdown.each{ wbs ->
            println wbs.toString()
        }
    }

/* create demo WBS and PBS */

    def createWbsAndPbs(User user) {
        def prjName = "滨州医学院烟台附属医院项目"
        def prj = Project.findByName(prjName) ?: new Project(name: prjName, description: '项目的简单描述',
                author: user).save(failOnError: true)
        if (Workbreakdown.count == 0) {
            //WBS demo
            (1..5).each { j ->
                def wbs = new Workbreakdown(code: j.toString(), title: "201${j}度").save(failOnError: true)
                (1..10).each {i ->
                    wbs.addToTasks(new Task(project: prj,
                            title: "DemoTask${i}",
                            description: "幕墙招标",
                            code: "${j}.${i}",
                            status: "drafted").save(failOnError: true))
                }
            }
        }
        if (Projectbreakdown.count == 0) {
            //PBS Demo
            (1..5).each { j ->
                def pbs = new Projectbreakdown(code: j.toString(), title: "201${j}度", project: prj).save(failOnError: true)
                (1..10).each {i ->
                    pbs.addToTasks(new Task(project: prj,
                            title: "ProjectDemoTask${i}",
                            code: "${j}.${i}",
                            status: "drafted").save(failOnError: true))
                }
            }
        }


    }

}
