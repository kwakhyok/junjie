import cn.com.agilemaster.Role
import cn.com.agilemaster.User
import cn.com.agilemaster.UserProfile
import cn.com.agilemaster.Message
import cn.com.agilemaster.MessageRecipient
import cn.com.agilemaster.MessageTag

class BootStrap {

    def shiroSecurityService
    def grailsApplication
    def taskService
    def importService
    def organizationService

    def init = { servletContext ->

        // get the default roles defined in JunjieResources.groovy
        def defaultAdminRole = grailsApplication.config.junjie.default.adminrole
        def defaultUserRole = grailsApplication.config.junjie.default.userrole
        def defaultTestUser = grailsApplication.config.junjie.default.testuser
        def defaultAdminUser = grailsApplication.config.junjie.default.adminuser
        def defaultPassword = grailsApplication.config.junjie.default.password

        def adminPermissions = grailsApplication.config.junjie.permissions.admin
        def userPermissions = grailsApplication.config.junjie.permissions.user

        def adminRole = Role.findByName(defaultAdminRole) ?: new Role(name: defaultAdminRole).save(flush: true, failOnError: true)
        def userRole = Role.findByName(defaultUserRole) ?: new Role(name: defaultUserRole).save(flush: true, failOnError: true)

        adminPermissions.each {
            adminRole.addToPermissions(it).save(flush: true, failOnError: true)
        }
        userPermissions.each {
            userRole.addToPermissions(it).save(flush: true, failOnError: true)
        }

        def testUser = User.findByUsername(defaultTestUser) ?: new User(username: defaultTestUser,
                passwordHash: shiroSecurityService.encodePassword(defaultPassword),
                profile: new UserProfile(firstName: '三',
                        lastName: '李',
                        position: '计划科科长',
                        telephone: '18801123464',
                        email: 'pangyu@email.com',
                        enabled: true)
        ).save(failOnError: true)

        def adminUser = User.findByUsername(defaultAdminUser) ?: new User(username: defaultAdminUser,
                passwordHash: shiroSecurityService.encodePassword(defaultPassword),
                profile: new UserProfile(firstName: '四',
                        lastName: '张',
                        position: '项目部负责人',
                        telephone: '18801123464',
                        email: 'yupangyu@email.com',
                        enabled: true)).save(failOnError: true)


        assert adminUser.addToRoles(adminRole).addToRoles(userRole).save(failOnError: true)
        assert testUser.addToRoles(userRole).save(failOnError: true)

        //   taskService.createWbsAndPbs('ROOT','牟平人民医院(滨州医学院附属医院)建设项目', adminUser)
        //   taskService.planLastDemoTasks(3)

//        importService.createProjectsFromExcel("/Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx", adminUser)

//        importService.createOrgsFromExcel("/Users/guo/Documents/Development/AgileMaster滨州医学院文档/资料管理2.xlsx", adminUser)
//        importService.importDesignCategories("/Users/guo/Documents/Development/AgileMaster滨州医学院文档/设计.xlsx",adminUser)
        // organizationService.createDemoOrganizations(adminUser)
        createDemoMessages(adminUser)
    }

    def createDemoMessages(sender) {

        def tags = ['label-info': '设计', 'label-important': '投资', 'label-cool': '施工',
                'label-inverse': '合同', 'label-success': '监理', 'label-warning': '总览', 'label-normal': '采购']
        def messageTag
        tags.each {tag ->
            messageTag = new MessageTag(name: tag.value, label: tag.key).save(flush: true)
            (1..5).each {
                def params = [title: "氧气室招投标....${it}",
                        body: "<h1>xxxxxxxx</h1>",
                        recipients: 'admin,test']
                def msg = new Message(title: params.title, body: params.body,
                        sender: sender)
                msg.addToTags(messageTag)
                def recipients = params.recipients.split(',')
                recipients.each { recipient ->
                    msg.addToRecipients(new MessageRecipient(message: msg, recipient: User.findByUsername(recipient)))
                }
                if (msg.save(failOnError: true)) {
                    println "MESSAGE was created! ${msg.title} -- ${msg.tags}"
                } else {
                    msg.errors.each {println it}
                }
            }
        }
    }

    def destroy = {
    }

}
