package cn.com

import cn.com.agilemaster.User
import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject
import org.apache.shiro.session.Session
import cn.com.agilemaster.MessageTag
import cn.com.agilemaster.MessageStatus

/**
 * AgilemasterTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class AgilemasterTagLib {

    static namespace = "am"

    def taskService

    /*
   *   @attr date REQUIRED should be Date type
   * */

    def dateFromNow = { attrs ->
        def date = attrs.date
        def niceDate = calculateFromNow(date)
        out << niceDate
    }


    /*
    *   @attr date REQUIRED should be Date type
    * */
    def formatDate = { attrs ->
        def date = attrs.date
        out << date.format("yyyy-MM-dd")

    }

    def formatCurrentUser = { attrs ->
        Subject currentUser = SecurityUtils.subject
        def username = currentUser.principal.toString()
        //def username = attrs.username
        def user = User.findByUsername(username)
        if (user && currentUser.isAuthenticated()) {
            out << user.profile?.lastName + user.profile?.firstName + " (" + user.profile?.position + ")"
        } else {
            out << "匿名用户"
        }
    }
    /*
    *  @attr user REQUIRED should be the type of the User domain class
    * */
    def formatUser = { attrs ->
        def user = attrs.user
        if (user) {
            out << user.profile?.lastName + user.profile?.firstName + " (" + user.profile?.position + ")"
        } else {
            out << '未知用户'
        }
    }
    /*
    * @attr message REQUIRED Domain Message Class
    * @attr class REQUIRED style class
    * */

    def outBoxTableEntry = {attrs ->
        def recipient = attrs.messageRecipient
        def tag = recipient.message?.tag
        def status = recipient.status
        out << "<tr class=\"" + attrs.class + "\">"
        out << "<td><input type=\"checkbox\"></td>"
        out << "<td class=\"from\">"
        def statusClass = (status == MessageStatus.UNREAD) ? "glyphicons dislikes" : "glyphicons star"
        out << "<span class=\"${statusClass}\"><i></i></span>"
        out << recipient.message?.sender?.profile
        if (recipient.message?.uploadedFile?.size() > 0) {
            out << " <span class=\"glyphicons paperclip\"><i></i></span>"
        }
        out << "</td>"
        def tagLabel

        switch (tag) {
            case MessageTag.BID:
                tagLabel = "<span class=\"label label-warning\">投标</span>"
                break
            case MessageTag.INVESTMENT:
                tagLabel = "<span class=\"label label-success\">投资</span>"
                break
            case MessageTag.SUPERVISION:
                tagLabel = "<span class=\"label label-inverse\">监理</span>"
                break
            case MessageTag.DESIGN:
                tagLabel = "<span class=\"label label-important\">设计</span>"
                break
            case MessageTag.NORMAL:
                tagLabel = ""
                break
            default:
                tagLabel = ""
                break
        }

        out << "<td>" + tagLabel + "&nbsp;"
        out << recipient.message?.title
        out << "</td>"
        out << "<td class=\"date\">${am.dateFromNow(date: recipient.message?.dateCreated)}</td>"

        //out << "<td><span class='label label-info'>回</span><span class='label label-important'>转</span></td>"
        //out << "</tr>"

    }

/*
   *  @attr tags REQUIRED
   * */
    def messageTagLabel = { attrs ->
        def messageTags = attrs.tags
        messageTags.each {tag ->
            out << "<span class=\"label " + tag.label + "\">" + tag.name + "</span>"
        }
    }
/*
*  @attr status REQUIRED inList:['drafted', 'planned', 'processing','completed']
* */
    def formatTaskStatus = { attrs ->
        def status = attrs.status
        if (status == 'drafted') {
            out << "<span class='label label-important'>已草拟</span>"
        } else {
            if (status == 'planned') {
                out << "<span class='label label-inverse'>已分配</span>"
                //out << render(template: '/templates/percentageSlider', model: [ratio:0])
            } else if (status == 'processing') {
                out << "<span class='label label-info'>执行中</span>"
            } else if (status == 'completed') {
                out << "<span class='label label-success'>已完成</span>"
            } else {
                out << "<span class='label'>状态未知</span>"
            }
        }
    }

/*
*  @attr task REQUIRED must be the task domain class , used in task list to record the completion of a task
* */

    def taskCompletionSlider = { attrs ->
        def task = attrs.task
        def plan = task?.currentPlan
        def complete = plan?.completeRatio
        def ratio = complete ? Math.round(complete * 100) / 100 : 80
        out << render(template: "/templates/percentageSlider", model: [ratio: 30])
    }

/*
* @attr task REQUIRED must be the task domain class , used in header main menu
* */

    def renderTaskPercentage = { attrs ->
        def task = attrs.task
        def plan = task?.currentPlan
        def complete = plan?.completeRatio
        def ratio = complete ? Math.round(complete * 100) / 100 : 80
        task.metaClass.percentage = ratio
        out << render(template: '/templates/taskPercentageEntry', model: [task: task])


    }
/*
* @attr span REQUIRED must be the number between 1 and 12
* @attr icon REQUIRED must be icons in this theme
* @attr title REQUIRED must be the title of the box
* @attr canFold REQUIRED must be true or False to provide the folding and close buttons
* */
    def boxContainer = {attrs, body ->
        def span = attrs.span
        def icon = attrs.icon
        def title = attrs.title
        def canFold = attrs.canFold
        out << "<div class='box span" + span + " '>"
        out << "<div class='box-header'>"
        out << "<h2><i class='halflings-icon "
        out << icon
        out << " '></i><span class=\"break\"></span>"
        out << title
        out << "</h2>"
        if (canFold == 'true') {
            out << "<div class=\"box-icon\">" +
                    "<a href=\"#\" class=\"btn-minimize\"><i class=\"halflings-icon chevron-up\"></i></a>" +
                    "<a href=\"#\" class=\"btn-close\"><i class=\"halflings-icon remove\"></i></a>" +
                    "</div>"
        }
        out << "</div>"
        out << "<div class='box-content'>"
        out << body()
        out << "</div></div>"

    }


    static String calculateFromNow(Date date) {
        def now = new Date()
        def diff = Math.abs(now.time - date.time)
        final long second = 1000
        final long minute = second * 60
        final long hour = minute * 60
        final long day = hour * 24
        final long week = day * 7

        def niceTime = ""
        long calc = 0

        calc = Math.floor(diff / week)
        if (calc) {
            niceTime += calc + "周"
            diff %= week
        }

        calc = Math.floor(diff / day)
        if (calc) {
            niceTime += calc + "天"
            diff %= day
        }

        calc = Math.floor(diff / hour)
        if(calc){
            niceTime += calc + "小时"
            diff %= hour
        }
/*
        calc = Math.floor(diff / minute)
        if(calc){
            niceTime += calc + "分"
            diff %= minute
        }
       */

        if (!niceTime) {
            niceTime = "刚才"
        } else {
            niceTime += (date.time > now.time) ? "之后" : "之前"
        }

        return niceTime
    }


}
