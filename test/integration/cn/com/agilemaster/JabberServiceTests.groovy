package cn.com.agilemaster

/**
 * Created with IntelliJ IDEA.
 * User: guo
 * Date: 13-3-27
 * Time: AM11:32
 * To change this template use File | Settings | File Templates.
 */

class JabberServiceTests extends GroovyTestCase {
     def jabberService
     void testWriteToQueue(){
         def post = [user:[userId:'chuckxxx'], content: 'is backstroking across the atlantic']
         def jabberIbs = ['abc@gmail.com','cde@gmail.com']
         jabberService.sendMessage(post,jabberIbs)
     }
}
