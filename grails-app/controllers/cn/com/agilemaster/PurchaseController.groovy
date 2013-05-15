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

    def importService

    def listBidSectionsByCat = {
        def bids
        if(params.cat){
            bids = BidSection.findAllByBidCategory(params.cat)

        }else{
            bids = BidSection.findAll()
        }
        render(template: 'bidSectionList', model: [filteredBidSections: bids])
    }


    def ajaxImportLocalBidSection = {
        try {
            importService.importLocalBidSections()
            def rootPrj = Project.findByCode('ROOT')
            if (!rootPrj) {
                log.error("ROOT Project was not found")
                render {
                    div(class: 'alert alert-error', 'ROOTProject was not found!')
                }
            } else {
                def bids = BidSection.findAllByProject(rootPrj)
                render(template: 'bidSectionList', model: [filteredBidSections: bids])
            }
        }catch(IOException ie){
            log.error(ie.message)
            render {
                div(class: 'alert alert-error', ie.message)
            }
        }
    }

    def ajaxImportIntentionOrgs = {
        try{
            importService.importIntentionOrgs()
            render template: 'intentionOrgList', model: [orgs:Organization.list()]
        }catch(IOException ie){
            log.error(ie.message)
            render{
                div(class:'alert alert-warning', 'Importing Failed')
            }
        }
    }
}
