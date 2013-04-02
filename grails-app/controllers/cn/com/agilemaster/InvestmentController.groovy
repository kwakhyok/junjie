package cn.com.agilemaster

/**
 * InvestmentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class InvestmentController {

    static scaffold = Investment
	def index = {

    }

    def createDemoPlan = {
        def project = Project.find({true})
        def title = '2013年牟平人民医院投资计划'
        def investment = Investment.findByTitle(title) ?: new Investment(project: project,
                author: session.currentUser, title:title, projectSum: 100000.00, isPaid: false).save(failOnError: true)

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
}
