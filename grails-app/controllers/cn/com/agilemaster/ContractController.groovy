package cn.com.agilemaster

import org.apache.shiro.SecurityUtils

/**
 * ContractController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ContractController {

    def userService

    static scaffold = ContractDocument

    def index = {
        def lastContract
        if(ContractDocument.count>0){
            def c = ContractDocument.createCriteria()
            lastContract = c.list {
                maxResults(1)
                order("dateCreated", "desc")
            }.get(0)
        }else{
            lastContract = ContractDocument.findByCode('demo1') ?: new ContractDocument(code: "demo1", title: "xxx合同副本",
                    signDate: new Date(),
                    partyB: "烟台市土地规划局",
                    contact: "庞玉成",
                    contractType: "Ledger",
                    contractSum: 2.0 * 1000000, paymentRatio: 2.0  * 1.40f,
                    author: userService.getCurrentUser()
            ).save(failOnError: true)
        }

        def ledgerList = ContractDocument.findAllByContractType("Ledger")
        def paymentList = ContractDocument.findAllByContractType("Payment")
        println('ledgerlist: ' + ledgerList.size())
        [paymentList: paymentList, ledgerList: ledgerList, contractInstance: lastContract]
    }

    def ajaxGetContract = {
        if(params.id){
            def contract = ContractDocument.get(params.id)
            render(template: 'contractDetail', model: [contractInstance: contract])
        }else{
            log.error("params.id not found")
        }
    }

    def addDemoContract = {
        ContractDocument.list().removeAll()
        def currentUser = userService.getCurrentUser();
        (1..5).each {
            ContractDocument.findByCode("czbe${it}")?: new ContractDocument(code: "czbe${it}", title: "${it}合同副本",
                    signDate: new Date(),
                    partyB: "烟台市土地规划局${it}",
                    contact: "庞玉成",
                    contractType: "Ledger",
                    contractSum: it * 1000000, paymentRatio: it * 1.40f,
                    author: currentUser
            ).save(failOnError: true)
        }

        (1..5).each {
            ContractDocument.findByCode("czbeq${it}")?:
            new ContractDocument(code: "czbeq${it}", title: "${it}付款合同副本",
                    signDate: new Date(),
                    partyB: "烟台市土地规划局${it}",
                    contact: "庞玉成",
                    contractType: "Payment",
                    contractSum: it * 1000000, paymentRatio: it * 1.40f,
                    author: currentUser
            ).save(failOnError: true)
        }
      //  assert ContractDocument.count == 4
        redirect(action: 'index')
    }


    def printCurrentUser = {
        def subject = SecurityUtils.subject;
        render subject?.principal
    }
}
