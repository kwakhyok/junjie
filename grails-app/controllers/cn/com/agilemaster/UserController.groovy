package cn.com.agilemaster

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.UsernamePasswordToken

/**
 * UserController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserController {

    def shiroSecurityService
    def userService
    def grailsApplication

    def index = { }

    def create = { UserCreationCommand command ->
        if (!params.create) return

        def role = Role.findByName(grailsApplication.config.junjie.default.userrole)
        if (!role) {
            command.password = null
            command.passwordRepeat = null
            flash.message = 'Default Role not found.'
            return [userDetails: command]
        }
        if (!command.hasErrors()) {
            def props = command.properties
            def user = new User(props)
            user.profile = new UserProfile(props)

            user.passwordHash = shiroSecurityService.encodePassword(command.password)
            user.profile.enabled = true

            if (!user.save()){
                command.password = ''
                command.passwordRepeat = ''
                flash.message = "Error Registering new user"
                return [userDetails: command]
            }
            role.addToUsers(user)
            user.addToRoles(role)
            // TODO: send a welcome email

            def authToken = new UsernamePasswordToken(user.username, command.password)
            SecurityUtils.subject.login(authToken)

            redirect(controller: 'home', action: 'newindex')
        }else{
            def errorString = ''
            command.errors.each{
                errorString += '\n' + it.toString() }
            log.debug("User Register errors: ${errorString}")
            flash.message = errorString
            return [userDetails: command]
        }


    }
}


class UserCreationCommand {

    String username
    String password
    String passwordRepeat
    String firstName
    String lastName
    String position
    String telephone
    String email
    String fax
    String memo
    boolean enabled
    byte[] photo

    static constraints = {
        username(nullable: false, blank: false, unique: true)

        //Ensure password does not match username
        password(size: 1..10, blank: false, validator: {passwd, urc ->
            return passwd != urc.username
        })
        passwordRepeat(size: 1..10, blank: false, validator: {passwd2, urc ->
            return passwd2 == urc.password
        })
        firstName size: 1..10, blank: false
        lastName size: 1..10, blank: false
        position size: 1..10, blank: false
        telephone size: 1..15, blank: false
        email email: true
        fax size: 1..15, nullable: true
        memo maxSize: 1000, nullable: true
        photo(nullable: true)
    }

}