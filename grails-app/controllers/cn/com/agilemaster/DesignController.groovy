package cn.com.agilemaster

/**
 * DesignController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DesignController {

    static scaffold = Design
    public def rootCategories = ['通用类','医用类','后勤类','文化类']
	def index = {
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



}
