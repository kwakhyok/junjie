package cn.com.agilemaster

import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject

/**
 * UserService
 * A service class encapsulates the core business logic of a Grails application
 */
class UserService {

    static transactional = true
    def grailsApplication
    def shiroSecurityService


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

    def createOtherDemoUsers(context)  {
        def webpath = context.getRealPath("")
        println ("createOtherDemoUsers: current context real path is: " + webpath)
        def usernames = ['me', 'you', 'he', 'she']
        def firstNames = ['丰', '奕', '华', '文']
        def lastNames = ['张', '郭', '刘', '赵']
        def positions = ['计划科科长', '项目部经理', '投资部主任', '监理人']
        def telephones = ['18801123464', '18801123464', '18801123464', '18801123464']
        def emails = ['yupangyu@email.com', 'yupangyu@email.com', 'yupangyu@email.com', 'yupangyu@email.com']

        def photos = ['images/avatar/avatar7.jpeg',
                'images/avatar/avatar2.jpeg',
                'images/avatar/avatar3.jpeg',
                'images/avatar/avatar4.jpeg']



        def r = grailsApplication.config.junjie.default.adminrole
        def adminRole = Role.findByName(r) ?: new Role(name: r).addToPermissions('*:*').save(flush: true)
        usernames.eachWithIndex { username, i ->
            def user1 =  User.findByUsername(username) ?: new User(username: username,
                    passwordHash: shiroSecurityService.encodePassword('password'),
                    profile: new UserProfile(firstName: firstNames[i], lastName: lastNames[i],
                            position: positions[i], telephone: telephones[i],
                            email: emails[i],
                            photo: new File(webpath + "/" +photos[i]).getBytes(), enabled: true))
            user1.addToRoles(adminRole).save(flush: true, failOnError: true)
        }

    }

    def getTwoRandomUsers = {
        def userList = User.list()
        Collections.shuffle(userList)
        return [userList.first(), userList.last()]
    }

}



