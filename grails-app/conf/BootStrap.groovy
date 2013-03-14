import cn.com.agilemaster.UserRole
import cn.com.agilemaster.Role
import cn.com.agilemaster.User
import cn.com.agilemaster.Organization
import cn.com.agilemaster.Task
import cn.com.agilemaster.BidSection
import cn.com.agilemaster.Project
import cn.com.agilemaster.Investment
import cn.com.agilemaster.Design
import cn.com.agilemaster.DesignCategory
import cn.com.agilemaster.UserProfile

class BootStrap {

    def grailsApplication

    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'me',
                enabled: true,
                password: 'password',
                profile: new UserProfile(firstName: '三',
                        lastName: '李',
                        position: '计划科科长',
                        telephone: '18801123464',
                        email: 'pangyu@email.com')
        ).save(failOnError: true)

        def meUser = new User(username: 'admin', enabled: true, password: 'password',
                profile: new UserProfile(firstName: '四',
                        lastName: '张',
                        position: '项目部负责人',
                        telephone: '18801123464',
                        email: 'yupangyu@email.com')).save(failOnError: true)


        UserRole.create testUser, adminRole, true
        UserRole.create meUser, adminRole, true

        createDemoData()

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
}
