package cn.com.agilemaster.utils

/**
 * ImportService
 * A service class encapsulates the core business logic of a Grails application
 */
class ImportService {

    static transactional = true

    def printExcelFile(filePath){
         new ExcelBuilder(filePath).eachLine([labels: true]){
             println "firstcolumn on row ${it.rowNum} = ${cell(0)}"
         }
    }
}
