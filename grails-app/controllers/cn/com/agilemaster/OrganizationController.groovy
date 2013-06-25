package cn.com.agilemaster

import org.springframework.dao.DataIntegrityViolationException

/**
 * OrganizationController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
//@Secured(['ROLE_ADMIN'])
class OrganizationController {

    static scaffold = Organization
}
