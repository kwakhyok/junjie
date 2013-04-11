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
        def wbs = Workbreakdown.list(max: 1, sort: "code", order: "desc").get(0)
        def titles = ['立项工作', '设计工作', '行政审批', '招标采购', '施工管理', '验收移交', '项目管理']
        def work
        def description = '以下是项目的描述'
        if (Work.count == 0) {
            Work rootWork = new Work(title: '医院建设项目', description: description)
            wbs.addToWorks(rootWork)
            titles.eachWithIndex {title, i ->
                work = new Work(title: title, description: "${i}  ${description}", parentWork: rootWork)
                wbs.addToWorks(work)
            }
            wbs.save(failOnError: true)
        }
        redirect(action: 'show', params: [id:wbs.id])
    }

    def listWorksAsJson = {

        def wbs
        def restWorks = []
        def rootWork
        if (params.wbsId) {
            wbs = Workbreakdown.get(params.wbsId)
            def works = wbs.works
            rootWork = works.find {work ->
                if (! work.parentWork) {return true}
                return false
            }

            works.each{work ->
               if (work.parentWork){
                  restWorks.add(work)
               }
            }
        }
        def results = [
                'rootItem' : rootWork,
                'items' : restWorks
        ]
        render results as JSON
    }


}
