package cn.com.agilemaster

/**
 * NewsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class NewsController {

    static scaffold = true
//	def index = { }

    private recordVisitor = {
         def visitor = session.currentUser
         def news = News.get(params.id)
         if(visitor){
             new NewsVisit(news:news, visitor: visitor).save()
         }else{
             new NewsVisit(news: news).save()
         }
    }

    def beforeInterceptor = [action:'recordVisitor', only:'show']


}
