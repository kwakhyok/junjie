package cn.com.agilemaster

/**
 * CalendarController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CalendarController {

    //static scaffold = true
	def index = {
        def currentUser = session.currentUser
        currentUser.refresh()
        def c = TaskPlan.createCriteria()
        def plans = c.list(max:10) {
            or {
                eq("assignedUser", currentUser)
                participants {
                    eq('username', currentUser.username)
                }
            }
            order 'endDate'
        }
        [plans:plans]
    }

    def listMyEvents = {

    }

    def listAvailableEvents = {

    }

    def acceptAssignedTask = {

    }
}
