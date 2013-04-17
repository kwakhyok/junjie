package cn.com.agilemaster



import grails.test.mixin.*
import org.junit.*
import cn.com.agilemaster.utils.ImportService

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(ImageService)
class ImageServiceTests {

    void testImportWorkTreeFromExcel() {
        Work instance = new Work()
        Workbreakdown wInstance = new Workbreakdown()
        mockDomain(Work,[instance])
        mockDomain(Workbreakdown,[wInstance])
        //mockDomain(Task)

        def wbs = new Workbreakdown(code: 'xxx', title: 'TEST_WBS').save(flush: true)
        def wbsId = wbs.code

        def importService = mockFor(ImportService)
        importService.demand.importWorkTreeFromExcel(
                new File('/Users/guo/Documents/Development/AgileMaster滨州医学院文档/wbs.xlsx'),
                wbsId)

        assertNotNull wbs.works
    }
}
