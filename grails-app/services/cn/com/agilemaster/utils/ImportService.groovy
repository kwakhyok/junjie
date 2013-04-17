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

    def printExcelFile(file) {
        new ExcelBuilder(file, true).eachLine([labels: true]) {
            println "firstcolumn on row ${it.rowNum} = ${cell(0)}"
        }
    }

    def createSpecialistsFromExcel(file){
        Specialist.executeUpdate('delete from Specialist')
        DecimalFormat df = new DecimalFormat("0")
        def telephone
        new ExcelBuilder(file,true).eachLine([labels: true]){
        //    println "${it.rowNum} : ${cell(0)}"
            if(it.rowNum > 1 && cell(0)){
               telephone = cell(2) instanceof Double ? df.format(cell(2)) : cell(2)
               new Specialist(name: cell(0), organization: cell(1), telephone: telephone, memo: cell(4)).save(flush: true)
            }
        }
    }



    def createBidOrgsFromExcel(file, user) {
        Collection<BidActivity>  existedActs = BidActivity.findAll()
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
            new ExcelBuilder(file, true).eachLine([labels: true]) {
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
                    bidSection = BidSection.findByCode(String.valueOf(cell(1)))?:
                        new BidSection(code: cell(1),title: cell(2),project: rootProject)
                    bidActivity =  new BidActivity(tags: '投标', organization: organization)
                    bidSection.addToActivities(bidActivity) // all of bidsections are a task of a rootProject
                   // println "The ${orgNum}th of Org!"
                    if(!bidSection.save(flush: true)){       // to ensure the activity is persisted in the database
                       println ("${it.rowNum} row has errors: \n")
                       bidSection.errors.each{println it}
                    }else{
                        println "${it.rowNum} saved! Activity:${bidActivity}"
                    }
                } else {
                    organization.errors.each { println "row ${rowNo}: \n ${it} \n" }
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
        def works = []
        def wbs = Workbreakdown.findByCode(wbsCode) ?:
            new Workbreakdown(code: wbsCode, title: '2013年度', description: 'xxx').save(failOnError: true)
        if (wbs) {
            wbs.works?.removeAll()
            wbs.save(failOnError: true)
            try {
                new ExcelBuilder(file, true).eachLine([labels: true]) {
                    works.push(new Work(code: cell(0), title: cell(1), description: cell(2)))
                }
                //build the tree and establish the hierarchies
                def rootWork = works.find {it.code = 'ROOT'}
                rootWork.wbs = wbs
                works.remove(rootWork)
                rootWork = Work.findByCode('ROOT') ?: rootWork.save(flush: true)



                def build
                build = {p, list ->
                    list.groupBy {it.code.split('\\.').first()}.each {el, sublist ->
                        p.wbs = wbs
                        p.save(failOnError: true)
                        def aLevel = Work.findByCode(el)
                        if (!aLevel) {
                            aLevel = sublist[0]
                            aLevel.wbs = wbs
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
                    it.wbs = wbs
                    wbs.addToWorks(it)
                }
                wbs.addToWorks(rootWork)
                wbs.save(failOnError: true)

            } catch (IOException ex) {
                throw new ImportException(message: 'WBS Excel File has errors!' + ex.message)
            }
        }
    }


    def importPBSFromExcel(file, pbsCode){

        def projects = []
        def pbs = Projectbreakdown.findByCode(pbsCode) ?:
            new Projectbreakdown(code: pbsCode, title: '2013年度').save(failOnError: true)
        if (pbs) {
            pbs.projects?.removeAll()
            pbs.save(failOnError: true)
            try {
                new ExcelBuilder(file, true).eachLine([labels: true]) {
                    projects.push(new Project(code: cell(0), name: cell(1), description: cell(2)))
                }
                //build the tree and establish the hierarchies
                def rootProject = projects.find {it.code = 'ROOT'}
                rootProject.pbs = pbs
                projects.remove(rootProject)
                rootProject = Project.findByCode('ROOT') ?: rootProject.save(flush: true)



                def build
                build = {p, list ->
                    list.groupBy {it.code.split('\\.').first()}.each {el, sublist ->
                        //println "p: ${p.code}"
                        //println "before el: ${el}"
                        //println "sublist:${sublist}"
                        p.pbs = pbs
                        p.save(failOnError: true)

                        def aLevel = Project.findByCode(el)
                        if (!aLevel) {
                            aLevel = sublist[0]
                            aLevel.pbs = pbs
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
                    it.pbs = pbs
                    pbs.addToProjects(it)
                }
                pbs.addToProjects(rootProject)
                pbs.save(failOnError: true)

            } catch (IOException ex) {
                throw new ImportException(message: 'PBS Excel File has errors!' + ex.message)
            }
        }
    }
}

