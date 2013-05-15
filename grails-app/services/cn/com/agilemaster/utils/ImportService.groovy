package cn.com.agilemaster.utils

import cn.com.agilemaster.Project
import cn.com.agilemaster.Organization
import cn.com.agilemaster.DesignCategory
import cn.com.agilemaster.Workbreakdown
import cn.com.agilemaster.Work
import cn.com.agilemaster.Specialist
import java.text.DecimalFormat
import org.apache.lucene.analysis.cn.ChineseAnalyzer
import cn.com.agilemaster.Projectbreakdown
import cn.com.agilemaster.BidSection
import cn.com.agilemaster.BidActivity
import cn.com.agilemaster.Task

/**
 * ImportService
 * A service class encapsulates the core business logic of a Grails application
 */

class ImportException extends RuntimeException {
    String message
    String type
}

class ImportService {

    static transactional = true

    def grailsApplication

    def printExcelFile(file) {
        new ExcelBuilder(file, true).eachLine([labels: true]) {
            //  println "firstcolumn on row ${it.rowNum} = ${cell(0)}"
        }
    }

    def createSpecialistsFromExcel(file) {
        Specialist.executeUpdate('delete from Specialist')
        DecimalFormat df = new DecimalFormat("0")
        def telephone
        new ExcelBuilder(file, true).eachLine([labels: true]) {
            //    println "${it.rowNum} : ${cell(0)}"
            if (it.rowNum > 1 && cell(0)) {
                telephone = cell(2) instanceof Double ? df.format(cell(2)) : cell(2)
                new Specialist(name: cell(0), organization: cell(1), telephone: telephone, memo: cell(4)).save(flush: true)
            }
        }
    }



    def createBidOrgsFromExcel(file, user) {
        Collection<BidActivity> existedActs = BidActivity.findAll()
        existedActs*.delete()
        Collection<Organization> existedOrgs = Organization.findAll()
        existedOrgs*.delete()
        Collection<BidSection> existedBidSections = BidSection.findAll()
        existedBidSections*.delete()

        def properties = new HashMap()
        def orgNum = 0
        def rootProject
        def project
        def rowNo
        try {
            def excelBuilder
            if (file instanceof File) {
                excelBuilder = new ExcelBuilder(file)
            } else {
                excelBuilder = new ExcelBuilder(file, true)
            }
            excelBuilder.eachLine([labels: true]) {
                if (cell(4) && cell(4) != '') {
                    def rootCode = 'ROOT'
                    rowNo = it.rowNum
                    properties.name = cell(4)
                    properties.contact = cell(12)
                    properties.address = cell(5)
                    properties.scope = cell(11)
                    properties.qualification = cell(11)
                    properties.brand = "无"
                    properties.capital = 1
                    properties.memo = "介绍：${cell(10)} \n备注: ${cell(15)}"
                    properties.qq = cell(14)
                    properties.contactTel = cell(13)
                    properties.website = cell(8)
                    properties.telephone = cell(6)
                    properties.fax = cell(7)
                    properties.email = cell(9)
                    def organization = Organization.findByName(properties.name) ?: new Organization()
                    def bidSection
                    def bidActivity
                    organization.properties = properties
                    if (organization.save()) {
                        orgNum++
                        rootProject = Project.findByCode(rootCode)
                        bidSection = BidSection.findByCode(String.valueOf(cell(1))) ?:
                            new BidSection(code: cell(1), title: cell(2), project: rootProject)
                        bidActivity = new BidActivity(tags: '投标', organization: organization)
                        bidSection.addToActivities(bidActivity) // all of bidsections are a task of a rootProject
                        // println "The ${orgNum}th of Org!"
                        if (!bidSection.save(flush: true)) {       // to ensure the activity is persisted in the database
                            log.error("${it.rowNum} row has errors: \n")
                            bidSection.errors.each {println it}
                        } else {
                            // println "${it.rowNum} saved! Activity:${bidActivity}"
                        }
                    } else {
                        organization.errors.each { log.error "row ${rowNo}: \n ${it} \n" }
                    }
                }
            }


        } catch (RuntimeException ex) {
            log.error(ex.message)
        }


    }

    def importDesignCategories(file) {
        def cat
        new ExcelBuilder(file, true).eachLine([labels: false]) {
            cat = DesignCategory.findByName(cell(0)) ?: new DesignCategory(name: cell(0)).save(failOnError: true)
            // println it.rowNum
            for (i in 1..40) {
                if (cell(i) && cell(i) != '') {
                    DesignCategory.findByName(cell(i)) ?: new DesignCategory(name: cell(i), parentCategory: cat).save(failOnError: true)
                }
            }

        }
    }

    def importWorkTreeFromExcel(file, wbsCode) {
        Collection<Workbreakdown> wbss = Workbreakdown.findAll()
        wbss*.delete()
        Collection<Work> existedWorks = Work.findAll()
        existedWorks*.delete()
        def works = []
        def wbs = Workbreakdown.findByCode(wbsCode) ?:
            new Workbreakdown(code: wbsCode, title: '2013年度', description: 'xxx').save(failOnError: true)
        if (wbs) {
            wbs.works?.removeAll()
            wbs.save(failOnError: true)
            try {
                new ExcelBuilder(file, true).eachLine([labels: true]) {
                    works.push(new Work(code: cell(0), title: cell(1), description: cell(2), wbs: wbs))
                }
                //build the tree and establish the hierarchies
                def rootWork = works.find {it.code == 'ROOT'}
                works.remove(rootWork)
                rootWork = Work.findByCode('ROOT') ?: rootWork.save(flush: true)
                def build
                build = {p, list ->
                    list.groupBy {it.code.split('\\.').first()}.each {el, sublist ->
                        p.save(failOnError: true)
                        def aLevel = Work.findByCode(el)
                        if (!aLevel) {
                            aLevel = sublist[0]
                            aLevel.parentWork = p
                            aLevel.save(failOnError: true)
                        }
                        el = sublist[0]
                        if (el.parentWork != rootWork) el.parentWork = aLevel
                        if (sublist.size() > 1) build(el, sublist[1..-1])
                    }
                }
                build(rootWork, works.sort {it.code.length()})
                works.each {
                    wbs.addToWorks(it)
                }
                wbs.addToWorks(rootWork)
                wbs.save(failOnError: true, flush: true)

                /* Turn leaf works as tasks, put root project as the relative project of each task */
                def rootProject = Project.findByCode('ROOT')

                if (rootProject) {
                    wbs.works?.each {work ->
                        rootProject.addToTasks(new Task(code: work.code, title: work.title,
                                status: 'drafted'))
                        assert rootProject.tasks

                    }
                    if (!rootProject.save(flush: true, failOnError: true)) {
                        rootProject.errors.each {println it}
                    }
                } else {
                    log.error("Root Project not found! ")
                }


            } catch (IOException ex) {
                throw new ImportException(message: 'WBS Excel File has errors!' + ex.message)
            }
        }
    }


    def importPBSFromExcel(file, pbsCode) {

        def projects = []
        def pbs = Projectbreakdown.findByCode(pbsCode) ?:
            new Projectbreakdown(code: pbsCode, title: '滨州医学院烟台附院在建项目').save(failOnError: true)
        if (pbs) {
            pbs.projects?.removeAll()
            pbs.save(failOnError: true, flush: true)
            try {
                new ExcelBuilder(file, true).eachLine([labels: true]) {
                    projects.push(new Project(code: cell(0), name: cell(1), description: cell(2)))
                }
                //build the tree and establish the hierarchies
                projects*.pbs = pbs
                def rootProject = projects.find {it.code == 'ROOT'}
                projects.remove(rootProject)
                rootProject = Project.findByCode('ROOT') ?: rootProject.save(flush: true)



                def build
                build = {p, list ->
                    list.groupBy {it.code.split('\\.').first()}.each {el, sublist ->
                        //println "p: ${p.code}"
                        //println "before el: ${el}"
                        //println "sublist:${sublist}"
                        p.save(failOnError: true)

                        def aLevel = Project.findByCodeAndPbs(el, pbs)
                        if (!aLevel) {
                            aLevel = sublist[0]
                            aLevel.parentProject = p
                            aLevel.save(failOnError: true)
                        }
                        el = sublist[0]
                        //println "after el: ${el}"
                        if (el.parentProject != rootProject) el.parentProject = aLevel

                        if (sublist.size() > 1) build(el, sublist[1..-1])
                    }
                }
                build(rootProject, projects.sort {it.code.length()})
                projects.each {
                    pbs.addToProjects(it)
                }
                pbs.addToProjects(rootProject)
                pbs.save(failOnError: true)

            } catch (IOException ex) {
                throw new ImportException(message: 'PBS Excel File has errors!' + ex.message)
            }
        }
    }


    def importLocalWBS(projectCode, projectTitle) {
        def configFilePath = grailsApplication.config.junjie.data.import.settings.wbsExcelPath
        try {
            def file = new File(configFilePath.toString())

            def pbs = Projectbreakdown.findByCode(projectCode) ?: new Projectbreakdown(code: projectCode, title: file.name).save(flush: true)
            def rootProject = Project.findByCode(projectCode) ?: new Project(code: projectCode, name: projectTitle, pbs: pbs).save(flush: true)

            rootProject.tasks?.clear()
            rootProject.save(flush: true)
            def tasks = []
            def excelBuilder
            if (file instanceof File) {
                excelBuilder = new ExcelBuilder(file)
            } else {
                excelBuilder = new ExcelBuilder(file, true)
            }
            excelBuilder.eachLine([labels: false]) {
                if (cell(0) && cell(0) != '') {
                    def task = new Task(code: cell(0), title: cell(1), project: rootProject)
                    tasks.push(task)
                    // log.info "A new task was created: " + cell(1)
                    rootProject.addToTasks(task)
                }
            }

            if (!rootProject.save(failOnError: true, flush: true)) {
                println "First step: Tasks Was Not Added to Project ${projectCode} !"
                return
            }
            def persistentTasks = rootProject.tasks
            def tasksWithCode = persistentTasks.collectEntries {[it.code, it]}
            persistentTasks.each { task ->
                if (task.code.toString().contains('.')) {
                    def parentCode = task.code[0..task.code.lastIndexOf('.') - 1]
                    if (parentCode != '') {
                        tasksWithCode[parentCode].addToSubTasks(task)
                        tasksWithCode[parentCode].save(flush: true)
                    }
                } else {
                    rootProject.addToTasks(task)
                }
                if (!task.save(flush: true, failOnError: true)) {
                    println "Second step: Task Was Not Updated with parentTask:  ${task.code} !"
                    return
                }
                // archive the rest of wbs and keep the current wbs as on-progress
                Workbreakdown.list().each {wbs ->
                    wbs.status = 'archived'
                    wbs.save(flush: true)
                }
                new Workbreakdown(code: projectCode, title: projectTitle, rootProject: rootProject).save(flush: true)

            }

        } catch (IOException ie) {
            println ie.message
            return
        }


    }

    def importLocalPBS(pbsCode) throws ImportException {
        def configFilePath = grailsApplication.config.junjie.data.import.settings.pbsExcelPath
        try {
            def file = new File(configFilePath.toString())
            def pbs = Projectbreakdown.findByCode(pbsCode) ?: new Projectbreakdown(code: pbsCode, title: file.name).save(flush: true)

            pbs.projects?.clear() // delete all sub project, remember all-delete-orphan?
            def rootProject = Project.findByCode(pbsCode) ?: new Project(code: pbsCode, name: '医院建设项目', pbs: pbs)
            if (!rootProject.save(flush: true, failOnError: true)) {
                println('root project not found! ')
                return
            }
            pbs.save(flush: true)
            def projects = []
            def excelBuilder
            if (file instanceof File) {
                excelBuilder = new ExcelBuilder(file)
            } else {
                excelBuilder = new ExcelBuilder(file, true)
            }
            excelBuilder.eachLine([labels: false]) {
                if (cell(0) && cell(0) != '') {
                    def project = new Project(code: cell(0), name: cell(1))
                    projects.push(project)
                    // println "A new project was created: " + cell(1)
                    pbs.addToProjects(project)
                }
            }
            if (!pbs.save(failOnError: true, flush: true)) {
                println "First step: Tasks Was Not Added to Project ${pbsCode} !"
            }

            def c = Project.createCriteria()
            def persistentProjects = c.list {
                and {
                    eq('pbs', pbs)
                    ne('code', 'ROOT')
                }
                order('code')
            }
            def projectsWithCode = persistentProjects.collectEntries {[it.code, it]}
            persistentProjects.each { project ->
                if (project.code.toString().contains('.')) {
                    def parentCode = project.code[0..project.code.lastIndexOf('.') - 1]
                    if (parentCode != '') {
                        //project.parentProject = projectsWithCode[parentCode]
                        projectsWithCode[parentCode].addToSubProjects(project)
                    }
                } else {
                    //project.parentProject = rootProject
                    rootProject.addToSubProjects(project)
                }
                // println "myCode: ${project.code}, parentCode: ${project.parentProject?.code}"
                if (!project.save(flush: true, failOnError: true)) {
                    println "First step: Task Was Not Updated with parentTask:  ${project.code} !"
                }
            }


        } catch (IOException ie) {
            println ie.message
            return
        }
    }


    def importLocalBidSections = {
        def fpath = grailsApplication.config.junjie.data.import.settings.bidSectionExcelPath
        try{
            def file = new File(fpath?.toString())
            println file.absoluteFile

        } catch(IOException ie){

        }
    }



}
