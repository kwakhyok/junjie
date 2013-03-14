package cn.com.agilemaster

/**
 * AdministratorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AdministratorController {


    def index = { }

    def listUsers = {
        def users = User.list(max:100)
        render (template: "users", model: [userInstanceList:users, userInstanceTotal: users.size()])
    }

    def listRoles = {
        def roles = Role.list(max: 100)
        render(template: "roles", model: [roleInstanceList:roles, roleInstanceTotal: roles.size()])
    }



    def listOrgs = {
        def orgs = Organization.list(max: 100)
        render(template: "orgs", model: [organizationList:orgs, organizationTotal:orgs.size()])
    }



    def listDesigns = {}

    def listBidCats = {}

}
