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
        importService.createOrgsFromExcel(mhf, session.currentUser)
        redirect(controller:'information',action: 'index')
    }

    def importProjects = {
        def mhf = request.getFile('projectFile')
        importService.createProjectsFromExcel(mhf, session.currentUser)
        redirect(controller: 'information', action: 'index')
    }

    def importDesignCategories = {
        def mhf = request.getFile('categoryFile')
        importService.importDesignCategories(mhf)
        redirect(controller: 'design', action: 'index')
    }

    def listDesigns = {}

    def listBidCats = {}

}
