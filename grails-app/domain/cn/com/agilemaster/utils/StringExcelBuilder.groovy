package cn.com.agilemaster.utils

import org.apache.poi.hssf.usermodel.HSSFRow
import org.apache.poi.ss.usermodel.WorkbookFactory
import org.apache.poi.xssf.usermodel.XSSFRow
import org.springframework.web.multipart.MultipartFile

/**
 * Created with IntelliJ IDEA.
 * User: guo
 * Date: 13-4-15
 * Time: AM10:12
 * To change this template use File | Settings | File Templates.
 */
class StringExcelBuilder {

    def workbook
    def labels
    def row


    StringExcelBuilder(MultipartFile file) {

        def is = file.inputStream
        try {
            protocol()
            workbook = WorkbookFactory.create(is)
            is.close()
        } catch (IOException ex) {
            log.error(ex.message)
        }finally{
            is?.close()
        }


    }

    void protocol() {
        HSSFRow.metaClass.getAt = {int idx ->
            def cell = delegate.getCell(idx)
            if (!cell) {
                return null
            }
            return cell.stringCellValue
        }

        XSSFRow.metaClass.getAt = {int idx ->
            def cell = delegate.getCell(idx)
            if (!cell) {
                return null
            }
            return cell.stringCellValue
        }
    }

    def getSheet(idx) {
        def sheet
        if (!idx) idx = 0
        if (idx instanceof Number) {
            sheet = workbook.getSheetAt(idx)
        } else if (idx ==~ /^\d+$/) {
            sheet = workbook.getSheetAt(Integer.valueOf(idx))
        } else {
            sheet = workbook.getSheet(idx)
        }
        return sheet
    }

    def cell(idx) {
        if (labels && (idx instanceof String)) {
            idx = labels.indexOf(idx.toLowerCase())
        }
        return row[idx]
    }

    def propertyMissing(String name) {
        cell(name)
    }

    def eachLine(Map params = [:], Closure closure) {
        def offset = params.offset ?: 0
        def max = params.max ?: 9999999
        def sheet = getSheet(params.sheet)
        def rowIterator = sheet.rowIterator()
        def linesRead = 0

        if (params.labels) {
            labels = rowIterator.next().collect {it.toString().toLowerCase()}
        }
        offset.times { rowIterator.next() }

        closure.setDelegate(this)

        while (rowIterator.hasNext() && linesRead++ < max) {
            row = rowIterator.next()
            closure.call(row)
        }
    }

}
