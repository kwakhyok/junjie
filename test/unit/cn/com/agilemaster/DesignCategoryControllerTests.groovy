package cn.com.agilemaster



import grails.test.mixin.*
import org.junit.*
import grails.test.ControllerUnitTestCase

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
//@TestFor(DesignCategoryController)
class DesignCategoryControllerTests extends ControllerUnitTestCase{

    void testShow() {
        def t1 = new DesignCategory(name: 'T1')
        def t2 = new DesignCategory(name: 'T2')
        def t3 = new DesignCategory(name: 'T3')

        mockDomain(DesignCategory, [ t1, t2, t3 ])

        controller.params.id = 2

        def returnMap = controller.show(2)
        assertEquals 'T2', returnMap.designCategoryInstance.name
    }
}
