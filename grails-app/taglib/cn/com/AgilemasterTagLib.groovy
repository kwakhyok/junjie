package cn.com

import cn.com.agilemaster.User
import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject
import org.apache.shiro.session.Session

/**
 * AgilemasterTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class AgilemasterTagLib {

    static namespace = "am"

    def dateFromNow = { attrs ->
        def date = attrs.date
        def niceDate = calculateFromNow(date)
        out << niceDate
    }

    def formatDate = { attrs ->
        def date = attrs.date
        out << date.format("yyyy-MM-dd")

    }

    def formatCurrentUser = { attrs ->
        Subject currentUser = SecurityUtils.subject
        def username = currentUser.principal.toString()
        //def username = attrs.username
        def user = User.findByUsername(username)
        if (user && currentUser.isAuthenticated()){
            out << user.profile.lastName+user.profile.firstName+" (" + user.profile.position + ")"
        }else{
            out << "匿名用户"
        }
    }

    def testSession = {
        Subject currentUser = SecurityUtils.subject
        Session session = currentUser.session

        out << session.properties
    }

    static String calculateFromNow(Date date){
        def now = new Date()
        def diff = Math.abs(now.time - date.time)
        final long second = 1000
        final long minute = second * 60
        final long hour = minute * 60
        final long day = hour * 24
        final long week = day * 7

        def niceTime  = ""
        long calc = 0

        calc = Math.floor(diff / week)
        if(calc){
            niceTime += calc + "周"
            diff %= week
        }

        calc = Math.floor(diff / day)
        if(calc){
            niceTime += calc + "天"
            diff %= day
        }

        calc = Math.floor(diff / hour)
        if(calc){
            niceTime += calc + "小时"
            diff %= hour
        }

        calc = Math.floor(diff / minute)
        if(calc){
            niceTime += calc + "分"
            diff %= minute
        }

        if(!niceTime){
            niceTime = "刚才"
        }else{
            niceTime += (date.time > now.time)? "之后" : "之前"
        }

        return niceTime
    }


}
