package cn.com.agilemaster



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(DemoTree)
class DemoTreeTests {

    void testTree() {
        mockDomain(DemoTree)
        def oneTree = new DemoTree(code: 'ROOT', title: 'DemoRoot1').save(flush: true)
        def firstLevel
        (1..5).each {
            firstLevel = new DemoTree(code: 'ROOT.' + it, title: '1stLevel' + it, parent: oneTree)
            oneTree.addToChildren(firstLevel).save(flush: true)
        }
        assertEquals('Equals', 'ROOT', oneTree.rootNode.code)
        assertNull(oneTree.parent)
        oneTree.children.each {
            assertEquals('1stLevel Equals:', 'ROOT', it.rootNode.code)
            assertNotNull it.parent
        }
        oneTree.children.each { aTree ->
            (1..5).each {
                def leaf = new DemoTree(code: "${aTree.code}.${it}", title: "2ndLevel${it}", parent: aTree)
                aTree.addToChildren(leaf).save(flush: true)
                assertEquals('Is Root Node found?', 'ROOT', leaf.rootNode.code)
            }
        }

        assertTrue(oneTree.isRoot())
         firstLevel = oneTree.children.iterator().next()
         assertFalse(firstLevel.isRoot())
    }
}
