package cn.com.agilemaster

import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UserService {

    //static transactional = true

    def grailsApplication

    def getCurrentUser = {
        Subject subject = SecurityUtils.subject
        if(!subject.isAuthenticated()){
           log.debug('user is not authenticated')
           return
        }else{
           String username =    subject.principal.toString()
           def currentUser =  User.findByUsername(username)
            if(currentUser){
                return currentUser
            }else{
                println "[USER SERVICE]: user not found! "
            }

        }
    }

    def getOneAdmin = {
        def role = Role.findByName(grailsApplication.config.junjie.default.adminrole)
        role.users.iterator().next()
    }

    def getOneUser = {
        def role = Role.findByName(grailsApplication.config.junjie.default.userrole)
        role.users.iterator().next()
    }
}



