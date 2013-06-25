package cn.com.agilemaster

/**
 * DesignController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DesignController {

    static scaffold = Design

    def importService

    public def rootCategories = ['通用类','医用类','后勤类','文化类']
    public def categories = ['主体建筑类设计','后勤楼,肿瘤中心设计','市政工程类设计','园林绿化类设计','地下车库设计','装饰装修类设计']

    def index = {
        redirect(action: 'design')
    }

    def design = {

        def totalNum = [300,247,64,84]
        def completionNum = [267,187,34,45]
        def cTimes = [3,4,2,5]
        def catMapList = []
        rootCategories.eachWithIndex{ cat, i ->
            def catMap = [:]
            println i
            catMap.put 'name', cat
            catMap.put 'totalNum', totalNum[i]
            catMap.put 'completionNum', completionNum[i]
            catMap.put 'completion', (100 * completionNum[i] / totalNum[i] as int)
            catMap.put 'num', cTimes[i]
            catMapList << catMap
            println catMap
        }

        def cats = DesignCategory.findAll()
        cats = cats.findAll{it.parentCategory != null}


        render view: 'design', model: [categories: catMapList, designCategories: cats]
    }





}
