package cn.com.agilemaster

import cn.com.agilemaster.utils.ExcelBuilder

/**
 * InvestmentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class InvestmentController {

    static scaffold = Investment

    static demoTitle = '2013年牟平人民医院投资计划'

	def index = {

    }

    def createDemoPlan = {
        def project = Project.findByCode('ROOT') // find the root project

        def investment = Investment.findByTitle(demoTitle) ?: new Investment(project: project,
                author: session.currentUser, title:demoTitle, projectSum: 100000.00, isPaid: false).save(failOnError: true)

        ['01','02','03','04','05','06','07','08','09','10','11','12'].each{
            def date = Date.parse('yyyy-MM-dd', "2013-${it}-10")
            investment.addToActualPayment(new InvestmentAction(paymentDate: date, amount: new Random().nextFloat(),
                    organization: Organization.get(1),
                    isFact: false,
                    author: session.currentUser)).save(failOnError: true)
        }


        ['01','02','03','04','05','06','07','08','09','10','11','12'].each{
            def date = Date.parse('yyyy-MM-dd', "2013-${it}-10")
            investment.addToActualPayment(new InvestmentAction(paymentDate: date, amount: new Random().nextFloat(),
                    organization: Organization.get(1),
                    isFact: true,
                    author: session.currentUser)).save(failOnError: true)
        }

        redirect(view:'index')
    }

    def parseInvestmentActionByTitle = {
        def investment = Investment.findByTitle(demoTitle)
        def actual = new HashMap()
        def accu2 = 0
        investment?.actualPayment?.each{ action ->
            accu2 += action.amount
            actual.put(action.paymentDate.month.toString(), accu2);

        }
        println '------------plan-------------'
        def plan = new HashMap()
        def accumulation = 0
        investment?.plan?.each{ action ->
            accumulation += action.amount
            plan.put(action.paymentDate.month.toString(), accumulation );
            println  action.paymentDate.month.toString()
        }
        actual.each{println it.key + ":" + it.value}
        plan.each{println it.key + ":" + it.value}
    }

    def create2013InvestmentPlan = {
        def mhf = request.getFile('investmentPlanFile')
        new ExcelBuilder(mhf,true).eachLine([labels: true]){
            if(it.rowNum > 2){
                println "${it.rowNum}: ${cell(1)} -- ${cell(2)}"
            }
        }
    }


}
