package cn.com.agilemaster

/**
 * JabberService
 * A service class encapsulates the core business logic of a Grails application
 */
class JabberService {

  //  static expose = ['jms']
  //  static destination = "jabberInQ"

    static listenerCount = 5

    void onMessage(msg){
        log.debug("Got Incomming Jabber Response from:${msg.jabberId}")
        try{
            println "${msg.jabberId}"
            println "${msg.content}"

        } catch(t){
            log.error "Error to get for ${msg.jabberId}", t
        }
    }


   void sendMessage(post,jabberIds){
       log.debug("Sending jabber message for ...")
       sendQueueJMSMessage("jabberOutQ", [userId:post.user.userId, content:post.content, to: jabberIds.join(',')])
   }
}
