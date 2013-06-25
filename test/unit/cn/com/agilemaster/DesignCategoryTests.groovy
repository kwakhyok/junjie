package cn.com.agilemaster

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class DesignCategoryTests {

    void setUp() {
        // Setup logic here
    }

    void tearDown() {
        // Tear down logic here
    }

    void testSave() {
        def cat = new DesignCategory(name: 'Hello')
        def cat1 = new DesignCategory(name: 'Hello1')
        def cat2 = new DesignCategory(name: 'Hello2')
        mockDomain(DesignCategory, [cat, cat1,cat2])

        def list = DesignCategory.findAllByName('Hello')
        assertEquals 1, list.size()
    }
}
