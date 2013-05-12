
/**
 * Created with IntelliJ IDEA.
 * User: guo
 * Date: 13-1-4
 * Time: AM10:36
 * To change this template use File | Settings | File Templates.
 */

junjie.default.organizations = {
    'orgA' {name: 'orgA'
            address:'orgAAdress'
            contact: 'contact'
            scope : 'scope'
            qualification: 'quaA'
            brand: 'NaNBrand'
            capital: 0
            memo: 'blablabla'}
}

junjie.default.userrole='ROLE_USER'
junjie.default.adminrole='ROLE_ADMIN'
junjie.default.testuser='test'
junjie.default.adminuser='admin'
junjie.default.password='password'

junjie.data.import.settings.wbsExcelPath = '/Users/guo/Dropbox/AgileMaster/WBS.xlsx'
junjie.data.import.settings.pbsExcelPath = '/Users/guo/Dropbox/AgileMaster/PBS.xlsx'


junjie.permissions.admin =  ['*:*']
junjie.permissions.user = ['home:*','message:*', 'task:*', 'newHome:*']

//shared constraints
grails.gorm.default.constraints = {
    taskStatus(inList: ['drafted','planned','processing','completed'],blank: false)
    startDate(blank: false)
    endDate (blank:false, validator: {val,obj ->
        return val.after(obj.startDate)
    })
    contractType(inList: ['Ledger', 'Payment'], blank: false)
    ActivityType(inList: ['Replan','Completion'], blank: false)
    WBSStatus(inList: ['archived', 'on-progress'],blank: false)
    TaskPriority(inList:['high', 'medium','low'],blank: false)
}

