package cn.com.agilemaster



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(BidActivity)
class BidActivityTests {

    void testConstraints() {
        mockDomain(BidSection, [new BidSection(code: '1', title: '2')])
        def org = new Organization(name: 'xxx')
        mockDomain(Organization, [org])

        def bc1 = new BidActivity(tags: 'intention',organization: org)
        mockForConstraintsTests(BidActivity,[bc1])

        assertTrue bc1.validate()


    }
}
