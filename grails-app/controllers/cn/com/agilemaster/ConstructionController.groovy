package cn.com.agilemaster

/**
 * ConstructionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ConstructionController {

	def index = {

    }

    def showConstructorDetails = {
        if(params.companyId){
            def cId = params.companyId
            def index = cId % 4
            try{
                render template: 'process'+index
            }catch(Exception ae){
                render{
                    div(class:'alert alert-warning', ae.message)
                }
            }

        }
    }
}
