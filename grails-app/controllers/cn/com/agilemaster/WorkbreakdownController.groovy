package cn.com.agilemaster

import grails.converters.JSON

/**
 * WorkbreakdownController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class WorkbreakdownController {

    static scaffold = true
    def index = {

    }


    def addWorks = {

        def wbs
        //wbs = Workbreakdown.list(max: 1, sort: "code", order: "desc").get(0)
        wbs = Workbreakdown.findByCode('20xxxxxx') ?: new Workbreakdown(code: '20xxxxxx', title: 'demo111').save(failOnError: true)

        def titles = ['A': '立项工作', 'B': '设计工作', 'C': '行政审批', 'D': '招标采购',
                'E': '施工管理', 'F': '验收移交', 'G': '项目管理']
        def rootCode = 'ROOT'
        def work
        def description = '以下是项目的描述'
        if (!wbs.works) {
            Work rootWork = Work.findByCode(rootCode) ?: new Work(code: rootCode, title: '医院建设项目', description: description)
            wbs.addToWorks(rootWork)
            titles.each {
                work = Work.findByCode(it.key) ?: new Work(code: it.key,
                        title: it.value, description: "${it.value}  ${description}", parentWork: rootWork)
                wbs.addToWorks(work)
            }
            wbs.save(failOnError: true)
        }
        redirect(action: 'show', params: [id: wbs.id])
    }

    def createWork = {

    }

    def listWorksAsJson = {

        def wbs
        def rootWork
        if (params.wbsId) {
            wbs = Workbreakdown.findByCode(params.wbsId)
            def jsonMap = [:]
            def workList = []
            rootWork = wbs?.works?.find {it.isRootWork()}
            def works = wbs?.works?.findAll {!it.isRootWork()}
            //works.each{println it.code}
            jsonMap.put('code', rootWork.code)
            jsonMap.put('title', rootWork.title)
            jsonMap.put('description', rootWork.description)

            works.each { work ->

                if (!work.subWorks?.isEmpty()) {
                    // A, B, C, D, E
                    def workMap = [:]
                    workMap.put('code', work.code)
                    workMap.put('title', work.title)
                    workMap.put('description', work.description)
                    def subWorks = []
                    work.subWorks.each {
                        def subWorkMap = [:]
                        subWorkMap.put('code', it.code)
                        subWorkMap.put('title', it.title)
                        subWorkMap.put('description', it.description)
                        subWorks.add(subWorkMap)
                    }
                    workMap.put('subWorks', subWorks)
                    workList.add(workMap)
                }


            }
            jsonMap.put('subWorks', workList)

            JSON.use('deep')
            render jsonMap as JSON
        }
    }


    def listAllWorksAsJson = {
        def wbs
        if (params.id) {
            wbs = Workbreakdown.findById(params.id)
            render wbs?.works as JSON
        }
    }

    def listProjectsAsJson = {
        def pbs
        def rootPrj
        if (params.pbsCode) {
            pbs = Projectbreakdown.findByCode(params.pbsCode)
            if (pbs) {
                def jsonMap = [:]
                def projectList = []
                rootPrj = pbs.projects.find {it.isRootProject()}
                def projects = pbs.projects.findAll {!it.isRootProject()}
                jsonMap.put('code', rootPrj.code)
                jsonMap.put('name', rootPrj.name)
                jsonMap.put('description', rootPrj.description)
                projects.each {project ->
                    if (!project.subProjects?.isEmpty()) {
                        def prjMap = [:]
                        prjMap.put('code', project.code)
                        prjMap.put('name', project.name)
                        prjMap.put('description', project.description)
                        def subPrjs = []
                        project.subProjects?.each {sprj ->
                            def sPrjMap = [:]
                            sPrjMap.put('code', sprj.code)
                            sPrjMap.put('name', sprj.name)
                            sPrjMap.put('description', sprj.description)
                            subPrjs.add(sPrjMap)
                        }
                        prjMap.put('subProjects', subPrjs)
                        projectList.add(prjMap)
                    }
                }
                jsonMap.put('subProjects', projectList)
                render jsonMap as JSON

            }
            else {
                println "params" + params
                render "<h2>${params.pbsCode} PBS was not found</h2>"
            }
        }
    }

    def turnWBSWorksIntoTasks = {
        if (params.wbsId) {
            def wbs = Workbreakdown.findById(params.wbsId)
            def project = Project.list().find {it.isRootProject()}
            if (!project) {
                flash.message = "请先导入项目"
                redirect(action: "index")
            } else {
                if (wbs) {
                    def task
                    wbs.works?.each { work ->
                        task = Task.findByCode(work.code) ?: new Task(code: work.code)
                        task.project = project
                        task.title = work.title
                        task.description = work.description
                        if (!task.save(failOnError: true)) {
                            log.error "Task ${task.code} was not saved! "
                        }
                    }
                    redirect(controller: 'task', action: 'list')
                }

            }

        }
    }

    def turnIntoWork = {
        if (params.workId) {
            def work = Work.get(params.workId)

        }
    }

}
