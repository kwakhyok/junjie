package cn.com.agilemaster

import org.springframework.dao.DataIntegrityViolationException
import org.grails.datastore.mapping.validation.ValidationException

/**
 * ActivityController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ActivityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        //redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [activityInstanceList: Activity.list(params), activityInstanceTotal: Activity.count()]
    }

    def create() {
        [activityInstance: new Activity(params)]
    }

    def save() {
        def activityInstance = new Activity(params)
        if (!activityInstance.save(flush: true)) {
            render(view: "create", model: [activityInstance: activityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])
        redirect(action: "show", id: activityInstance.id)
    }

    def show() {
        def activityInstance = Activity.get(params.id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
            redirect(action: "list")
            return
        }

        [activityInstance: activityInstance]
    }

    def edit() {
        def activityInstance = Activity.get(params.id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
            redirect(action: "list")
            return
        }

        [activityInstance: activityInstance]
    }

    def update() {
        def activityInstance = Activity.get(params.id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (activityInstance.version > version) {
                activityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'activity.label', default: 'Activity')] as Object[],
                        "Another user has updated this Activity while you were editing")
                render(view: "edit", model: [activityInstance: activityInstance])
                return
            }
        }

        activityInstance.properties = params

        if (!activityInstance.save(flush: true)) {
            render(view: "edit", model: [activityInstance: activityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])
        redirect(action: "show", id: activityInstance.id)
    }

    def delete() {
        def activityInstance = Activity.get(params.id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
            redirect(action: "list")
            return
        }

        try {
            activityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    /* custom actions */

    def batchAddDemoActivities() {
        def orgs = []
        def tasks  = []
        if (Organization.count < 2) {
            orgs = addOrganizations("烟台附属医院参建单位", "烟台市某路")
        }else{
            orgs = Organization.list(max: 10)
        }
        if (Task.count < 2 ){
           tasks = addTasks("滨州医学院烟台附属医院项目")
        }else{
            tasks = Task.list(max: 3)
        }
        def activityTags = Activity.constraints.tag?.inList
        for (org in orgs){
            for (task in tasks){
                Collections.shuffle(activityTags)
                def tag = activityTags.get(1)
                new Activity(organization: org, task: task, tag: tag).save(failOnError: true)
            }
        }

        redirect(controller:'activity', action:'list')

    }


    private List<Organization> addOrganizations(demoName, demoAddress) {
        List<Organization> orgs = []
        for (i in 1..10) {
            orgs.add new Organization(name: "${demoName}-${i}", address: "${demoAddress}--${i} -- 号").save(failOnError: true)
        }

        return orgs
    }

    private Set<Task> addTasks(projectName) {
        def today = new Date()
        Project.withTransaction {
            def prj = Project.findByName(projectName) ?:
                new Project(name: projectName, author: User.findByUsername('me'),
                        description: '项目的简单描述', startDate: today - 100,
                        endDate: today + 100,).save()

            (1..10).each {
                prj.addToTasks(new BidSection(code: "CODE${it}", title: "投标项目${it}", startDate: today - it, endDate: today + it,
                        estimateSum: 30, subSectionSum: 3, project: prj))
            }

            (1..10).each {
                prj.addToTasks(new Investment(title: "投资实例${it}", projectName: '幕墙项目', projectSum: 100, isPaid: false,
                        startDate: today - 10 - it, endDate: today + 10 + it, percentage: 20, project: prj))


            }

            (1..10).each {
                prj.addToTasks(new Design(title: "xx设计${it}", description: "这是个设计",
                        delivery: "图纸", designFee: 245.3, category: DesignCategory.DRINKING_WATER,
                        startDate: today - 10 - it, endDate: today + 10 + it,
                        project: prj))
            }

            prj.save(failOnError: true)
            return prj.tasks
        }

    }

    def batchAddOrganizations() {
        addOrganizations("烟台附属医院参建单位", "烟台市某路")
        redirect(controller: 'organization', action: 'list')
    }



    def batchAddTasks() {
        addTasks("滨州医学院烟台附属医院项目")
        redirect(controller: "task", action: "list")

    }


    def createActivity = {
        def org = Organization.findById(params.id)
        def activity = new Activity(organization: org)
        [activityInstance: activity]
    }


}
