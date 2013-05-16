
/**
 * Created with IntelliJ IDEA.
 * User: guo
 * Date: 13-5-9
 * Time: AM10:57
 * To change this template use File | Settings | File Templates.
 */
modules = {

    overrides{
        'jquery' {
            resource id: 'js', bundle: 'global', url:'acm/js/jquery-1.9.1.min.js', disposition: 'head'
        }
        'jquery-theme' {
            resource id: 'theme', url: 'acm/css/jquery-ui-1.8.21.custom.css', attrs: [media:'screen, projection']
        }
        'jquery-ui' {
            dependsOn 'jquery', 'jquery-theme'
            resource id: 'js', url: 'acm/js/jquery-ui-1.10.0.custom.min.js', disposition: 'head'
        }


        'bootstrap' {
            dependsOn 'jquery'
            resource id: 'css', url: 'acm/css/bootstrap.min.css'
            resource id: 'response_css',  url: 'acm/css/bootstrap-responsive.min.css'
            resource id: 'js', url: 'acm/js/bootstrap.min.js'
        }
    }

    acme {
        dependsOn 'jquery, jquery-ui, bootstrap'
        /*------------------------------CSS import part of ACME THEME ---------------------------------------*/
        resource url: "acm/css/fullcalendar.css";				/* Calendars Styles */
        resource url: "acm/css/chosen.css";					/* Select Boxes Styles */
        resource url: "acm/css/uniform.default.css";			/* Uniform Styles */
        resource url: "acm/css/jquery.cleditor.css";			/* Text Editor Styles. */
        resource url: "acm/css/jquery.noty.css";				/* Noty Notifications Style */
        resource url: "acm/css/noty_theme_default.css";		/* Noty Notifications Style */
        resource url: "acm/css/elfinder.min.css";				/* File Manager Style */
        resource url: "acm/css/elfinder.theme.css";			/* File Manager Style */
        resource url: "acm/css/jquery.iphone.toggle.css";		/* Styles for iPhone */
        resource url: "acm/css/uploadify.css";				/* Uploadify Styles */
        resource url: "acm/css/jquery.gritter.css";			/* Growl Like Notifications Styles */
        resource url: "acm/css/font-awesome.css";				/* Font Awesome Styles */
        resource url: "acm/css/font-awesome-ie7.css";			/* Font Awesome Styles */
        resource url: "acm/css/glyphicons.css";				/* Glyphicons Font */
        resource url: "acm/css/halflings.css";				/* Glyphicons Halflings Font */
        resource url: "acm/css/webfonts.css";					/* Google Web Fonts */
        /*-------------------------------END Import part of CSS ACME----------------------------------------*/
        resource url:"acm/css/retina.css"
        resource url:"acm/js/html5.js", wrapper: {s-> "<!--[if lt IE 9]>$s<![endif]-->"}
        resource url:"acm/css/ie.css", wrapper:  {s-> "<!--[if lt IE 9]>$s<![endif]-->"}
        resource url:"acm/css/ie9.css", wrapper: {s-> "<!--[if IE 9]>$s<![endif]-->"}

        resource url:"acm/css/style.css"
        resource url:"acm/css/style-responsive.css"

        /*----------------------------------JS part of ACME theme--------------------------------------------*/
        resource url: 'acm/js/jquery-migrate-1.0.0.min.js'
        resource url: 'acm/js/jquery.ui.touch-punch.js'
        resource url: 'acm/js/modernizr.js'
        resource url: 'acm/js/jquery.cookie.js'
        resource url: 'acm/js/fullcalendar.min.js'
        resource url: 'acm/js/jquery.dataTables.min.js'
        resource url: 'acm/js/excanvas.js'
        resource url: 'acm/js/jquery.flot.js'
        resource url: 'acm/js/jquery.flot.pie.js'
        resource url: 'acm/js/jquery.flot.stack.js'
        resource url: 'acm/js/jquery.flot.resize.min.js'
        resource url: 'acm/js/jquery.chosen.min.js'
        resource url: 'acm/js/jquery.uniform.min.js'
        resource url: 'acm/js/jquery.cleditor.min.js'
        resource url: 'acm/js/jquery.noty.js'
        resource url: 'acm/js/jquery.elfinder.min.js'
        resource url: 'acm/js/jquery.raty.min.js'
        resource url: 'acm/js/jquery.iphone.toggle.js'
        resource url: 'acm/js/jquery.uploadify-3.1.min.js'
        resource url: 'acm/js/jquery.gritter.min.js'
        resource url: 'acm/js/jquery.imagesloaded.js'
        resource url: 'acm/js/jquery.masonry.min.js'
        resource url: 'acm/js/jquery.knob.modified.js'
        resource url: 'acm/js/jquery.sparkline.min.js'
        resource url: 'acm/js/counter.js'
        resource url: 'acm/js/retina.js'
        resource url: 'acm/js/raphael.2.1.0.min.js'
        resource url: 'acm/js/justgage.1.0.1.min.js'
        /*---------------------------END of JS part of ACME theme--------------------------------------------*/
        resource url: 'acm/js/core.min.js'
        resource url: 'acm/js/charts.js'
        resource url: 'acm/js/custom.js'
    }

    tabletools{
        dependsOn 'acme'
        resource url:'acm/js/TableTools.js'
        resource url:'acm/js/ZeroClipboard.js'
    }

    jsgantt{
       dependsOn 'acme'
       resource url: 'css/jsgantt.css'
       resource url: 'js/jsgantt.js', bundle: 'jsgantt'
    }

    j_primitive{
        dependsOn('acme')
        resource url:'primitives/primitives.latest.css'
        resource url:'primitives/primitives.min.js'

    }

    bootstrap_editable{
        resource url: 'css/bootstrap-editable.css'
        resource url: 'js/bootstrap-editable.js'
    }

    bootstrap_bootbox{
        resource url: 'acm/js/bootbox.min.js'
    }




}