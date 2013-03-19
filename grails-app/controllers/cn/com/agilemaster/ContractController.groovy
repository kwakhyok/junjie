package cn.com.agilemaster

import org.apache.shiro.SecurityUtils

/**
 * ContractController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ContractController {



    def index = {

    }

    def addDemoContract = {
        ContractDocument.list().removeAll()
        (1..50).each{
            new ContractDocument(code:"czbe${it}", title: "${it}合同副本",
                    signDate: new Date() - 1,
                    partyB: "烟台市土地规划局${it}",
                    contact: "庞玉成",
                    contractType:"Ledger",
                    contractSum: it * 1000000, paymentRatio: it * 1.40f,
                    attachedFile:  [0, 0, 0, 0, 0]).save(failOnError: true)
        }

        (1..50).each{
            new ContractDocument(code:"czbeq${it}", title: "${it}付款合同副本",
                    signDate: ${new Date() - 1},
                    partyB: "烟台市土地规划局${it}",
                    contact: "庞玉成",
                    contractType:"Payment",
                    contractSum: it * 1000000, paymentRatio: it * 1.40f,
                    attachedFile:  [0, 0, 0, 0, 0]).save(failOnError: true)
        }
        redirect(action: 'index')
    }


    def printCurrentUser = {
         def subject = SecurityUtils.subject;
        render subject?.principal
    }
}
