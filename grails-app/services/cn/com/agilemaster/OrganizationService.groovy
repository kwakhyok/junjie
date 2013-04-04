package cn.com.agilemaster

import cn.com.agilemaster.utils.ExcelBuilder

/**
 * OrganizationService
 * A service class encapsulates the core business logic of a Grails application
 */
class OrganizationService {

    static transactional = true

    def importService

    def createDemoOrganizations(user) {

        def orgs = ['山东海瑞林医疗科技有限公司',
                '海南灵镜医疗净化工程有限公司',
                '西安市四腾工程有限公司',
                '烟台冰科集团有限公司',
                '上海德明医用设备工程有限公司',
                '烟台昕诺吉太阳能技术有限公司'
        ]

        orgs.each {oName ->
            def org = Organization.findByName(oName) ?: new Organization(
                    name: oName,
                    address: oName + ": [地址]",
                    contact: oName + ": [联系人]",
                    scope: oName + ": [经营范围]",
                    qualification: oName + ": [资质]",
                    brand: oName + ": [品牌]",
                    capital: 1,
                    memo: 'xxmemo',
                    user: user).save(failOnError: true)
        }
    }

}
