package cn.com.agilemaster

/**
 * GatewayService
 * A service class encapsulates the core business logic of a Grails application
 */
class GatewayService {

   // static expose = ['jabber', 'jms']
   // static destination = "jabberOutQ"

    void onMessage(msg){
        log.debug("Incoming Queue Request from: ${msg.userId} to: ${msg.to} content: ${msg.content}")
        def addrs = msg.to.split(",")
        addrs.each{addr ->
            log.debug "Sending to: ${addr}"
            sendJabberMessage(addr,msg.content)
        }
    }

    void onJabberMessage(jabber){
        log.debug("Incoming Jabber Message Received from ${jabber.from()} with body ${jabber.body}")
        def msg = [jabberId:jabber.from, content:jabber.body]
        sendQueueJMSMessage("jabberInQ",msg)
    }
}
