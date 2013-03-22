import cn.com.agilemaster.UserRole
import cn.com.agilemaster.Role
import cn.com.agilemaster.User
import cn.com.agilemaster.Organization
import cn.com.agilemaster.BidSection
import cn.com.agilemaster.Project
import cn.com.agilemaster.Investment
import cn.com.agilemaster.Design
import cn.com.agilemaster.DesignCategory
import cn.com.agilemaster.UserProfile
import cn.com.agilemaster.Workbreakdown
import cn.com.agilemaster.Projectbreakdown
import cn.com.agilemaster.Task

class BootStrap {

    def shiroSecurityService
    def grailsApplication

    def init = { servletContext ->

        // get the default roles defined in JunjieResources.groovy
        def defaultAdminRole = grailsApplication.config.junjie.default.adminrole
        def defaultUserRole = grailsApplication.config.junjie.default.userrole
        def defaultTestUser = grailsApplication.config.junjie.default.testuser
        def defaultAdminUser = grailsApplication.config.junjie.default.adminuser
        def defaultPassword = grailsApplication.config.junjie.default.password

        def adminRole = Role.findByName(defaultAdminRole) ?: new Role(name: defaultAdminRole).save(flush: true, failOnError: true)
        def userRole = Role.findByName(defaultUserRole) ?: new Role(name: defaultUserRole).save(flush: true, failOnError: true)

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


        createWbsAndPbs()

    }
    def destroy = {
    }



    void createWbsAndPbs() {
        def prjName = "滨州医学院烟台附属医院项目"
        def prj = Project.findByName(prjName) ?: new Project(name: prjName, description: '项目的简单描述', author: User.get(1)).save(failOnError: true)
        (1..5).each { j ->
            def wbs = new Workbreakdown(code: j.toString(), title: "201${j}度").save(failOnError: true)
            (1..3).each {i ->
                wbs.addToTasks(new Task(project: prj,
                        title: "DemoTask${i}",
                        code: "${j}.${i}",
                        status: "drafted").save(failOnError: true))
            }
        }
        (1..5).each { j ->
            def pbs = new Projectbreakdown(code: j.toString(), title: "201${j}度", project: prj).save(failOnError: true)
            (1..6).each {i ->
                pbs.addToTasks(new Task(project: prj,
                        title: "ProjectDemoTask${i}",
                        code: "${j}.${i}",
                        status: "drafted").save(failOnError: true))
            }
        }
    }
}
