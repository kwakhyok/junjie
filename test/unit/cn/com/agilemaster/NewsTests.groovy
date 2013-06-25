package cn.com.agilemaster



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(News)
class NewsTests {

    void testNewsModel() {
       //def author 1 = new User()
       mockDomain(News, [new News(title: 'xx1', content: 'xx2', isHead: true),
                         new News(title: 'xx2', content: 'xx3', isHead: false)])
       def item1 = new News(title: '', content: 'xx2', isHead: false)
       mockForConstraintsTests(News, [item1])
       assertFalse item1.validate()
       assertEquals 'blank', item1.errors['title']
    }
}
