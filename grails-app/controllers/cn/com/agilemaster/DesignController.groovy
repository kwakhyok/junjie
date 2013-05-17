package cn.com.agilemaster

/**
 * DesignController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DesignController {

    static scaffold = Design
    public def rootCategories = ['通用类','医用类','后勤类','文化类']
    public def categories = ['主体建筑类设计','后勤楼,肿瘤中心设计','市政工程类设计','园林绿化类设计','地下车库设计','装饰装修类设计']

    def index = {
        redirect(action: 'design')
    }

	def index1 = {
         def cat
         def sub
         def result = new HashMap<String, List>()
         rootCategories.each{
             cat = DesignCategory.findByName(it) ?: new DesignCategory(name:  it).save()
             sub = DesignCategory.findAllByParentCategory(cat)
             result.put(it, sub)
         }
        [categories:result]
    }


    def design = {

        def totalNum = [300,247,64,84,45,230]
        def completionNum = [267,187,34,45,23,198]
        def cTimes = [3,4,2,5,1,3]
        def catMapList = []
        categories.eachWithIndex{ cat, i ->
            def catMap = [:]
            println i
            catMap.put 'name', cat
            catMap.put 'totalNum', totalNum[i]
            catMap.put 'completionNum', completionNum[i]
            catMap.put 'completion', (completionNum[i] / totalNum[i])
            catMap.put 'num', cTimes[i]
            catMapList << catMap
            println catMap
        }

        render view: 'design', model: [categories: catMapList]
    }



}
