package cn.com.agilemaster

/**
 * JabberService
 * A service class encapsulates the core business logic of a Grails application
 */
class JabberService {

   void sendMessage(post,jabberIds){
       log.debug("Sending jabber message for ...")
       sendQueueJMSMessage("jabberOutQ", [userId:post.user.userId, content:post.content, to: jabberIds.join(',')])
   }
}
