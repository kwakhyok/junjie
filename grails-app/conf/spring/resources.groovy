import org.apache.activemq.spring.ActiveMQConnectionFactory
import org.springframework.jms.connection.SingleConnectionFactory

// Place your Spring DSL code here
beans = {
	customPropertyEditorRegistrar(CustomDateEditorRegistrar)
/*
    jmsConnectionFactory(SingleConnectionFactory) {
        targetConnectionFactory = { ActiveMQConnectionFactory cf ->
            // brokerURL = 'vm://localhost'
            brokerURL = 'tcp://localhost:61616'

        }
    }*/
/*
    connectionFactory(ActiveMQConnectionFactory){
        brokerURL = "tcp://localhost:61616"
    }*/

}
