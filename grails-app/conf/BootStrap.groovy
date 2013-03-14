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

class BootStrap {

def shiroSecurityService
    def init = { servletContext ->

        def adminRole =Role.findByName('ROLE_ADMIN')?: new Role(name: 'ROLE_ADMIN').save(flush: true, failOnError: true)
        def userRole =Role.findByName('ROLE_USER') ?: new Role(name: 'ROLE_USER').save(flush: true, failOnError: true)

        def testUser = User.findByUsername('me')?: new User(username: 'me',
                passwordHash: shiroSecurityService.encodePassword('password'),
                profile: new UserProfile(firstName: '三',
                        lastName: '李',
                        position: '计划科科长',
                        telephone: '18801123464',
                        email: 'pangyu@email.com',
                        enabled: true)
        ).save(failOnError: true)

        def adminUser = User.findByUsername('admin')?: new User(username: 'admin',
                passwordHash: shiroSecurityService.encodePassword('password'),
                profile: new UserProfile(firstName: '四',
                        lastName: '张',
                        position: '项目部负责人',
                        telephone: '18801123464',
                        email: 'yupangyu@email.com',
                        enabled: true)).save(failOnError: true)


        assert adminUser.addToRoles(adminRole).addToRoles(userRole).save(failOnError: true)
        assert testUser.addToRoles(userRole).save(failOnError: true)

        //   createDemoData()
        createWbsAndPbs()

    }
    def destroy = {
    }

    void createDemoData() {
        /* projects */
        def today = new Date()
        new Project(name: '滨州医学院烟台附属医院项目', description: '项目的简单描述', startDate: today - 100,
                endDate: today + 100, author: User.get(1))
                .addToTasks(
                new BidSection(code: '01BD', title: '标段1', description: '示范标段1', startDate:
                        today - 20, endDate: today + 20, subSectionSum: 2, estimateSum: 100))
                .addToTasks(
                new Investment(title: '投资实例1', projectName: '幕墙项目', projectSum: 100, isPaid: false,
                        startDate: today - 20, endDate: today + 20, percentage: 20))
                .addToTasks(
                new Design(title: '幕墙设计', designRequirement: '设计要求', delivery: '交付物',
                        startDate: today - 30, endDate: today + 10, designFee: 100.00, category: DesignCategory.DRINKING_WATER))
                .save(failOnError: true)
        /* organization demo */
        def org = new Organization(name: '烟台幕墙工程设备有限公司', address: '雁领路38号', contact: '董卿', user: User.get(1)).save()
    }

    void createWbsAndPbs(){
        def prj = new Project(name: '滨州医学院烟台附属医院项目', description: '项目的简单描述',author: User.get(1)).save(failOnError: true)
        (1..5).each{
            new Workbreakdown(code: it.toString(), title: "201${it}度" ).save(failOnError: true)
        }
        (1..5).each{
            new Projectbreakdown(code: it.toString(), title: "201${it}度", project: prj).save(failOnError: true)
        }
    }
}
