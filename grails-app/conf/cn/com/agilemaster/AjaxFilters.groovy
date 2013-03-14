package cn.com.agilemaster

/**
 * AjaxFilters
 * A filters class is used to execute code before and after a controller action is executed and also after a view is rendered
 */
class AjaxFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

        ajaxify(controller: '*', action: '*') {
            after = { Map model ->
                //only intercept AJAX request
                if (!request.xhr) {return true}
                // find our controller to see if the action is ajaxified
                def artefact = grailsApplication.getArtefactByLogicalPropertyName("Controller", controllerName)
                if(artefact){return true}

                def isAjaxified = artefact.clazz.declaredFields.find{
                    it.name == 'ajaxify' && isStatic(it.modifiers)
                }!=null

                def ajaxified = isAjaxified ? artefact.clazz?.ajaxify : []

                if (actionName in ajaxified || '*' in ajaxified) {
                    render(template: "/${controllerName}/modal/${actionName}Ajax",
                            model: model)
                    return false
                }

            }
        }
    }
}
