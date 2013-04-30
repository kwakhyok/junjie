package cn.com.agilemaster



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Message)
class MessageTests {

    void testSave() {
       mockDomain(User)
       def msg = new Message(sender: new User(username: 'yiguo', passwordHash: 'abde'),
       title: 'testMsg', body: '<h1>New Message</h1>').save(failOnError: true)
       assert Message.count == 1
    }
}
