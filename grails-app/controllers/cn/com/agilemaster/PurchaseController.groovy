package cn.com.agilemaster

/**
 * PurchaseController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PurchaseController {

    static scaffold = BidSection
	def index = {
        render view:'purchase'
    }

    def webpath={
        String absolutePath = servletContext.getRealPath("newpath/1");
        render "<h1>${absolutePath}</h1>"
    }

}
