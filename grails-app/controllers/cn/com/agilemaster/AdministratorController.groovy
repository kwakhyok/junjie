package cn.com.agilemaster

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile

/**
 * AdministratorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AdministratorController {

    def importService

    def index = { }

    def listUsers = {
        def users = User.list(max: 100)
        render(template: "users", model: [userInstanceList: users, userInstanceTotal: users.size()])
    }

    def listRoles = {
        def roles = Role.list(max: 100)
        render(template: "roles", model: [roleInstanceList: roles, roleInstanceTotal: roles.size()])
    }



    def listOrgs = {
        def orgs = Organization.list(max: 100)
        render(template: "orgs", model: [organizationList: orgs, organizationTotal: orgs.size()])
    }


    def importOrgs = {
        def mhf = request.getFile('orgFile')
        importService.createBidOrgsFromExcel(mhf, session.currentUser)
        redirect(controller:'information',action: 'index')
    }


    def importDesignCategories = {
        def mhf = request.getFile('categoryFile')
        importService.importDesignCategories(mhf)
        redirect(controller: 'design', action: 'index')
    }

    def importWBS = {
        def mhf = request.getFile('wbsFile')
        importService.importWorkTreeFromExcel(mhf, '4')
        def wbs = Workbreakdown.findByCode('4')
       /* wbs.works.each{
            println "${it.code}-${it.title}-parent: ${it.parentWork?.code}"
        }*/
        //importService.createWBSFromExcel('2013xxxx', '20133最新计划', mhf)
        //importService.printExcelFile(mhf)
        redirect(controller: 'workbreakdown', action: 'listWorksAsJson', params: [wbsId:4])
    }

    def importSpecialist = {
        def mhf = request.getFile('specialistFile')
        importService.createSpecialistsFromExcel(mhf)
        redirect(controller: 'information', action: 'index')
    }


    def importPBS = {
        def mhf = request.getFile('pbsFile')
        importService.importPBSFromExcel(mhf,'1')
        redirect(controller: 'project', action: 'list', params: [pbsId:4])
    }



    def listDesigns = {}

    def listBidCats = {}

}
