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
        lastWork = Workbreakdown.list(max: 1, sort: "code", order: "desc").get(0)
        return lastWork?.tasks?.sort {it.code}
    }


    def getTasksByCurrentUser() {
        //  def tasks = []
        def currentUser = userService.getCurrentUser()

        TaskPlan.findAllByAssignedUser(currentUser).collect {it.task}.unique()


    }


    def findAllTasksByPriority(priority) {

        return TaskPlan.findAllByPriority(priority).collect {it.task}
    }



    def planLastDemoTasks(wbsId) {
        def today = new Date()
        def wbs = Workbreakdown.get(wbsId)
        def tasks = wbs.tasks
        def priorities = ['high', 'medium', 'low']
        def before = [3, 4, 5, 6, 7, 8, 9, 10]
        def after = [3, 4, 5, 6, 7, 28, 9, 10]
        def ratios = [0.0, 18.0, 20.0, 37.0, 85.0, 90.0, 50.0, 40.0]
        if (tasks.size() > 0) {
            tasks.each { task ->
                Collections.shuffle(before)
                Collections.shuffle(after)
                Collections.shuffle(ratios)
                Collections.shuffle(priorities)
                def bDiff = before.get(0)
                def aDiff = after.get(0)
                def ratio = ratios.get(0)
                def priority = priorities.get(0)
                def newPlan = new TaskPlan(startDate: today - bDiff,
                        endDate: today + aDiff, completeRatio: ratio,
                        assignedUser: userService.getOneAdmin(),
                        author: userService.getOneAdmin(),
                        priority: priority)
                task.addToPlans(newPlan)
                task.status = 'planned'
                task.currentPlan = newPlan
                task.save(failOnError: true)
            }
        }
        wbs.status='on-progress'
        wbs.save(failOnError: true)
    }

    def recordTaskStatus(task, ratio) {
        def plan = task?.currentPlan
        if (plan) {
            plan.completeRatio = ratio
            plan.save(failOnError: true)
        }
    }

    def recordAllTaskStatus() {
        def startShuffle = [1..100]
        def endShuffle = [0..80]
        def date = new Date()

    }

/* create demo WBS and PBS */

    def createWbsAndPbs(code, prjName, user) {
        def pbs = Projectbreakdown.findByCode('PBS01')?: new Projectbreakdown(code: 'PBS01', title: '医院建设项目').save(failOnError: true)
        def prj = Project.findByCode(code) ?: new Project(pbs: pbs, code: code , name: prjName, description: '项目的简单描述',
                author: user).save(failOnError: true)

        //WBS demo
        (1..2).each { j ->
            def wbs = Workbreakdown.findByCode(j.toString()) ?:
                new Workbreakdown(code: j.toString(),
                        title: "201${j}年度", status: 'archived').save(failOnError: true)
            (1..9).each {i ->
                wbs.addToTasks(new Task(project: prj,
                        title: "DemoTask${i}",
                        description: "幕墙招标",
                        code: "${j}.${i}",
                        status: "drafted").save(failOnError: true))
            }
        }
        /* plan the last workbreakdown */
        def wbs = Workbreakdown.findByCode('3') ?: new Workbreakdown(code: '3',
                title: "2013年度", status: 'on-progress').save(failOnError: true)
        (1..9).each {i ->
            wbs.addToTasks(new Task(project: prj,
                    title: "DemoTask${i}",
                    description: "幕墙招标",
                    code: "3.${i}",
                    status: "planned").save(failOnError: true))
        }

        //PBS Demo
        (1..4).each { j ->
            def pbs1 = Projectbreakdown.findByCode(j.toString()) ?: new Projectbreakdown(code: j.toString(), title: "201${j}度",
                    status: 'on-progress').save(failOnError: true)
            (1..9).each {i ->
                pbs1.addToTasks(new Task(project: prj,
                        title: "ProjectDemoTask${i}",
                        code: "${j}.${i}",
                        status: "drafted").save(failOnError: true))
            }
        }


    }

}
