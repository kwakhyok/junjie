package cn.com.agilemaster.utils

import cn.com.agilemaster.Project
import cn.com.agilemaster.Organization
import cn.com.agilemaster.DesignCategory

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

    def printExcelFile(filePath) {
        new ExcelBuilder(filePath).eachLine([labels: true]) {
            println "firstcolumn on row ${it.rowNum} = ${cell(4)}"
        }
    }

    def createProjectsFromExcel(file, author) {
        def project
        def num = 0
        def rootProject = Project.findByCode('0000')

        if (rootProject) {
            try {
                new ExcelBuilder(file,true).eachLine([labels: true]) {
                    project = Project.findByCode(cell(1).toString()) ?:
                        new Project(code: cell(1), name: cell(2),
                                parentProject: rootProject, description: '<稍后添加>', author: author).save()
                }
            } catch (IOException ex) {
                log.error(ex.message)
            }

        } else {
            throw new ImportException(message: "The root project was not found!")
        }
    }



    def createOrgsFromExcel(file, user) {
        def properties = new HashMap()
        def orgNum = 0
        def rootProject
        def project
        def rowNo
        try {
            new ExcelBuilder(file,true).eachLine([labels: true]) {
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
                organization.properties = properties
                if (organization.save()) {
                    orgNum++
                    rootProject = Project.findByCode('0000')
                    project = Project.findByName(cell(2).toString()) ?:
                        new Project(name: cell(2),
                                description: '<无描述>',
                                parentProject: rootProject, author: user).save()


                } else {
                    organization.errors.each { println "row ${rowNo}: Validation error: ${it} \n" }
                }
            }


        } catch (RuntimeException ex) {
            log.error(ex.message)
        }


    }

    def importDesignCategories(file) {
        def cat
        new ExcelBuilder(file,true).eachLine([labels: false]) {
            cat = DesignCategory.findByName(cell(0).toString()) ?: new DesignCategory(name: cell(0)).save(failOnError: true)
            println it.rowNum
            for (i in 1..40) {
                if (cell(i) && cell(i) != '') {
                    DesignCategory.findByName(cell(i).toString()) ?: new DesignCategory(name: cell(i), parentCategory: cat).save(failOnError: true)
                }
            }

        }
    }

}

