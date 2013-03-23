package cn.com.agilemaster

/**
 * TaskService
 * A service class encapsulates the core business logic of a Grails application
 */
class TaskService {

    def userService

    static transactional = true

    def serviceMethod() {

    }


    /* create demo WBS and PBS */

    def createWbsAndPbs() {
        def prjName = "滨州医学院烟台附属医院项目"
        def prj = Project.findByName(prjName) ?: new Project(name: prjName, description: '项目的简单描述',
                author: userService.getCurrentUser()).save(failOnError: true)
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
