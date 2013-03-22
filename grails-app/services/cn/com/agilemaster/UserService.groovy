package cn.com.agilemaster

import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UserService {

    static transactional = true

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
}



