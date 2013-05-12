package cn.com.agilemaster

import static org.junit.Assert.*
import org.junit.*
import org.codehaus.groovy.grails.web.json.JSONObject
import grails.web.JSONBuilder

class ImportServiceTests {
    def importService
    def shiroSecurityService
    def grailsApplication
    def taskService

    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testImportWBS() {
        //importService.importLocalPBS('ROOT')

        //importService.importLocalWBS('ROOT', '医院建设管理')

        //assert Project.list().size() > 20

        //assert Task.list().size() > 20
    }

    def projectItems = [:]

    @Test
    void JsonOfPBS() {
        importService.importLocalPBS('ROOT')
        def rootPrj = Project.findByCode('ROOT')
        def printProjects
        printProjects = {project, arg ->
            println "${'| ' * arg} - ${project.name} \\"
            project?.subProjects?.each {subProject ->
                if (subProject.subProjects) {
                    printProjects(subProject, (arg + 1))
                } else {
                    println "${'| ' * (arg + 1)} - ${subProject.name} \\"
                }
            }
        }
        printProjects(rootPrj, 0)

/*        def pbs = Projectbreakdown.findByCode('ROOT')
        if (projectItems.isEmpty()) {
            def projects = Project.findAllByPbs(pbs)
            projects.each {
                if (!it.parentProject) {
                    //projectItems['code'] = it.code
                    //projectItems['name'] = it.name
                    projectItems[it] = [:]
                    println "projectItems: ${projectItems}"
                }
            }
        }
        projectItems.each { mi ->
            //  if (mi.key instanceof Project) {
            Project.findAllByParentProject(mi.key).each {subMi ->
                println subMi.code
                if (!subMi.parentProject) {
                    //      mi.value['code'] = subMi.code
                    //      mi.value['name'] = subMi.name
                    mi.value[subMi] = [:]
                    findMore(mi.value[subMi], subMi)
                }
            }
            // }
        }*/

    }




    private void findMore(mapEntry, mi) {   /*  mi: any parent project*/
        def moreItems = Project.findAllByParentProject(mi)
        if (!moreItems.isEmpty()) {
            moreItems.each {
                mapEntry[it] = [:]
                findMore(mapEntry[it], it)
            }
        }
    }

    @Test
    void testListTaskFromProject(){
        importService.importLocalWBS('ROOT', '医院建设项目')
        def prj = Project.findByCode('ROOT')
        def jsonMap = taskService.listTasksAsJson(prj)
        println jsonMap
    }

    @Test
    void testPlanAllTasks(){
        def rootProject = Project.findByCode('ROOT');
        def users =
        rootProject.tasks.each{ task ->

        }
    }

    @Test
    void testCreateUsers() {
        def usernames = ['me', 'you', 'he', 'she']
        def firstNames = ['丰', '奕', '华', '文']
        def lastNames = ['张', '郭', '刘', '赵']
        def positions = ['计划科科长', '项目部经理', '投资部主任', '监理人']
        def telephones = ['18801123464', '18801123464', '18801123464', '18801123464']
        def emails = ['yupangyu@email.com', 'yupangyu@email.com', 'yupangyu@email.com', 'yupangyu@email.com']
        def photos = ['/Users/guo/Documents/Development/workspaces/grails2/junjie/web-app/acm/img/avatar7.jpg',
                '/Users/guo/Documents/Development/workspaces/grails2/junjie/web-app/acm/img/avatar8.jpg',
                '/Users/guo/Documents/Development/workspaces/grails2/junjie/web-app/acm/img/avatar5.jpg',
                '/Users/guo/Documents/Development/workspaces/grails2/junjie/web-app/acm/img/avatar3.jpg']

        def r = grailsApplication.config.junjie.default.adminrole
        def adminRole = Role.findByName(r) ?: new Role(name: r).save(flush: true)
        adminRole.addToPermissions('*:*')
        usernames.eachWithIndex { username, i ->
            def user1 = User.findByUsername(username) ?: new User(username: username,
                    passwordHash: shiroSecurityService.encodePassword('password'),
                    profile: new UserProfile(firstName: firstNames[i], lastName: lastNames[i],
                            position: positions[i], telephone: telephones[i],
                            email: emails[i],
                            photo: new File(photos[i]).getBytes(), enabled: true))
            user1.addToRoles(adminRole).save(flush: true, failOnError: true)
        }
        assert User.list().size() == 6


    }

}
