package cn.com.agilemaster

import grails.converters.XML
import grails.converters.JSON


/**
 * InformationController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */


class InformationController {

    def index = {
        def intentionOrgs = BidActivity.findAllByTags('意向').collect{it.organization}
        def bidingOrgs = BidActivity.findAllByTags('投标').collect{it.organization}
        println "Orgs: ${Organization.count}, BidActivity: ${BidActivity.count}, BidSection: ${BidSection.count}"
        render(view: 'index', model: [intentionOrgs:intentionOrgs, bidingOrgs:bidingOrgs])
    }


    def orgs = {
        def orgs
        if(params.tag){
            def activityTag = params.tag
            orgs = Organization.withCriteria{
                activities {
                    ilike('tag', "%${activityTag}%")
                }
            }
        }else{
            orgs = Organization.list(max: 10)
        }
        println "PARAMS.TAG: " + params.tag
        render(template: 'orgs', model: [organizationInstanceList: orgs.unique(), organizationInstanceTotal: orgs.unique().size()])
    }

    def bluePrints = {
        def bluePrints = BluePrintDocument.list(max: 10)
        render (template: 'blueprints', model: [bluePrintList: bluePrints, bluePrintTotal: bluePrints.size()])
    }

    def superVisionDocuments = {
        def superVisionDocuments = SupervisionDocument.list(max: 10)
        render(template: 'superVisionDocuments', model: [superVisionList:superVisionDocuments, supervisionTotal: superVisionDocuments.size()])
    }



    def orgsJson = {
        def activityTag = params.tag ?: ''
        def orgs = Organization.withCriteria{
            activities {
                ilike('tag', "%${activityTag}%")
            }
        }
        render orgs as JSON
    }


    def orgWithIntention = {
        def intentionOrgs = Organization.withCriteria {
            activities {
                ilike('tag', '%意向%')
            }
        }
        render(template: 'orgs', model: [organizationInstanceList: intentionOrgs.unique(), organizationInstanceTotal: intentionOrgs.size()])


    }

    def orgWithBiding = {

        def intentionOrgs = Organization.withCriteria {
            activities {
                ilike('tag', '%投标%')
            }
        }
        render(view: 'index', model: [organizationInstanceList: intentionOrgs.unique(), organizationInstanceTotal: intentionOrgs.size()])


    }

    def orgWithParticipation = {

        def intentionOrgs = Organization.withCriteria {
            activities {
                ilike('tag', '%参建%')
            }
        }
        render(view: 'index', model: [organizationInstanceList: intentionOrgs.unique(), organizationInstanceTotal: intentionOrgs.size()])


    }

    def specialists = {

        def intentionOrgs = Organization.withCriteria {
            activities {
                ilike('tag', '%专家%')
            }
        }
        render(view: 'index', model: [organizationInstanceList: intentionOrgs.unique(), organizationInstanceTotal: intentionOrgs.size()])
    }

    def blueprints = {

    }

    def preProcedures = {

    }

    def supervisions = {

    }
}
