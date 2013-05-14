/*----------------------Task Management-----------------------------*/

var m_timer = null;

var currentWbsId = $('#wbsMenu  li:last  a  span.hidden').text();

function showTaskOrgChart() {
    console.log('begin to show the task org chart');
    $.getJSON('listTasksAsJson', {wbsId:currentWbsId}, function (data) {
        ResizePlaceholder('#orgdiagram');
        GetWBSTask(data);
        $(window).resize(function () {
            onWindowResize('#orgdiagram');
        });
    });
}

$(function () {
    showTaskOrgChart();
});

jQuery(document).ready(function () {
    /*  == .live(), but in jquery 1.8 there's more preformant way! */
    $(document).delegate('#wbsMenu li a', 'click', function (event, data) {
        // console.log('this: ' + $(this).children('span.hidden').text() + ' type: ' + event.type);
        var myWbsId = $(this).children('span.hidden').text();
        $.getJSON("listTasksAsJson", {wbsId:myWbsId}, function (data) {
            ResizePlaceholder('#orgdiagram');
            // SetupWBSWidget(data);
            GetWBSTask(data);
            $(window).resize(function () {
                onWindowResize('#orgdiagram');
            });

            event.preventDefault();
        });
    });


    $(document).delegate('#pbsMenu li a', 'click', function (event, data) {
        var myPbsCode = $(this).children('span.hidden').text();
        $.getJSON("listProjectsAsJson", {pbsCode:myPbsCode}, function (data) {
            ResizePlaceholder('#pbsdiagram');
            SetupPBSWidget(data);
            $(window).resize(function () {
                onWindowResize('#pbsdiagram');
            });
            event.preventDefault();
        });
    });

});


function onWindowResize(diagramDiv) {
    if (m_timer == null) {
        m_timer = window.setTimeout(function () {
            ResizePlaceholder();
            jQuery(diagramDiv).orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh)
            window.clearTimeout(m_timer);
            m_timer = null;
        }, 300);
    }
}

function SetupWBSWidget(data) {
    var options = new primitives.orgdiagram.Config();
    var rootItem = new primitives.orgdiagram.ItemConfig();
    rootItem.title = data.title;
    rootItem.description = data.description;
    rootItem.image = "http://www.basicprimitives.com/demo/images/photos/a.png";
    var subWorks = data.subWorks;
    for (var index = 0; index < subWorks.length; index++) {
        var subItem = new primitives.orgdiagram.ItemConfig();
        subItem.code = subWorks[index].code;
        //console.log(subItem.code);
        subItem.title = subWorks[index].code + " " + subWorks[index].title;
        subItem.description = subWorks[index].description;
        subItem.image = "http://www.basicprimitives.com/demo/images/photos/b.png";
        if (subWorks[index].hasOwnProperty('subWorks')) {
            var subSubWorks = subWorks[index].subWorks;
            for (var j = 0; j < subSubWorks.length; j++) {
                //console.log(j + ": " + subSubWorks[j].code);
                var subSubItem = new primitives.orgdiagram.ItemConfig();
                subSubItem.code = subSubWorks[j].code;
                subSubItem.title = subSubWorks[j].code + " " + subSubWorks[j].title;
                subSubItem.description = subSubWorks[j].description;
                subSubItem.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                subItem.items.push(subSubItem);
            }
            subItem.items.sort(function (a, b) {
                var codeA = a.code;
                var codeB = b.code;
                if (codeA > codeB) return 1;
                if (codeA < codeB) return -1;
            });
        }
        rootItem.items.push(subItem);
    }
    rootItem.items.sort(function (a, b) {
        var codeA = a.code;
        var codeB = b.code;
        if (codeA > codeB) return 1;
        if (codeA < codeB) return -1;
    });
    options.rootItem = rootItem;
    options.cursorItem = rootItem;
    options.hasSelectorCheckbox = primitives.common.Enabled.False;
    $("#orgdiagram").orgDiagram(options);

}

var rootImg = "${createLinkTo(dir: 'acm/img', file: 'avatar8.jpg')}";
var level1Img = "${createLinkTo(dir: 'acm/img', file: 'avatar6.jpg')}";
var level2Img = "${createLinkTo(dir: 'acm/img', file: 'avatar7.jpg')}";
function GetWBSTask(data) {
    var options = new primitives.orgdiagram.Config();
    var rootItem = new primitives.orgdiagram.ItemConfig();
    rootItem.title = data.title;
    rootItem.description = data.description;
    rootItem.image = rootImg;
    var subTasks = data.subTasks;
    for (var index = 0; index < subTasks.length; index++) {
        var subItem = new primitives.orgdiagram.ItemConfig();
        subItem.code = subTasks[index].code;
        //console.log(subItem.code);
        subItem.title = subTasks[index].code + " " + subTasks[index].title;
        subItem.description = subTasks[index].description;
        subItem.image = level1Img;
        if (subTasks[index].hasOwnProperty('subTasks')) {
            var subSubWorks = subTasks[index].subTasks;
            for (var j = 0; j < subSubWorks.length; j++) {
                //console.log(j + ": " + subSubWorks[j].code);
                var subSubItem = new primitives.orgdiagram.ItemConfig();
                subSubItem.code = subSubWorks[j].code;
                subSubItem.title = subSubWorks[j].code + " " + subSubWorks[j].title;
                subSubItem.description = subSubWorks[j].description;
                subSubItem.image = level2Img;
                subItem.items.push(subSubItem);
            }
            subItem.items.sort(function (a, b) {
                var codeA = a.code;
                var codeB = b.code;
                if (codeA > codeB) return 1;
                if (codeA < codeB) return -1;
            });
        }
        rootItem.items.push(subItem);
    }
    rootItem.items.sort(function sortCode(a, b) {
        var al = a.code.split("\\.");
        var bl = b.code.split("\\.");
        if (al.length > 0) {
            var i = 0;
            while (i < al.length) {
                if (parseInt(al[i]) > parseInt(bl[i])) return 1;
                if (parseInt(al[i]) < parseInt(bl[i])) return -1;
                if (parseInt(al[i]) == parseInt(bl[i])) {
                    i++;
                }
            }
        }
        return 0;
    });
    options.rootItem = rootItem;
    options.cursorItem = rootItem;
    options.hasSelectorCheckbox = primitives.common.Enabled.False;
    $("#orgdiagram").orgDiagram(options);

}

function sortCode(a, b) {
    var al = a.code.split("\\.");
    var bl = b.code.split("\\.");
    if (al.length > 0) {
        var i = 0;
        while (i < al.length) {
            if (parseInt(al[i]) > parseInt(bl[i])) return 1;
            if (parseInt(al[i]) < parseInt(bl[i])) return -1;
            if (parseInt(al[i]) == parseInt(bl[i])) {
                i++;
            }
        }
    }
    return 0;
}


function SetupPBSWidget(data) {
    var options = new primitives.orgdiagram.Config();
    var rootItem = new primitives.orgdiagram.ItemConfig();
    rootItem.title = data.name;
    rootItem.description = data.description;
    rootItem.image = "http://www.basicprimitives.com/demo/images/photos/a.png";
    var subProjects = data.subProjects;
    for (var index = 0; index < subProjects.length; index++) {
        var subItem = new primitives.orgdiagram.ItemConfig();
        subItem.code = subProjects[index].code;
        subItem.title = subProjects[index].code + " " + subProjects[index].name;
        subItem.description = subProjects[index].description;
        subItem.image = "http://www.basicprimitives.com/demo/images/photos/b.png";
        if (subProjects[index].hasOwnProperty('subProjects')) {
            var subSubProjects = subProjects[index].subProjects;
            for (var j = 0; j < subSubProjects.length; j++) {
                var subSubItem = new primitives.orgdiagram.ItemConfig();
                subSubItem.code = subSubProjects[j].code;
                subSubItem.title = subSubProjects[j].code + " " + subSubProjects[j].name;
                subSubItem.description = subSubProjects[j].description;
                subSubItem.image = "http://www.basicprimitives.com/demo/images/photos/c.png";
                subItem.items.push(subSubItem);
            }
            subItem.items.sort(function (a, b) {
                var codeA = a.code;
                var codeB = b.code;
                if (codeA > codeB) return 1;
                if (codeA < codeB) return -1;
            });
        }
        rootItem.items.push(subItem);
    }
    rootItem.items.sort(function (a, b) {
        var codeA = a.code;
        var codeB = b.code;
        if (codeA > codeB) return 1;
        if (codeA < codeB) return -1;
    });
    options.rootItem = rootItem;
    options.cursorItem = rootItem;
    options.hasSelectorCheckbox = primitives.common.Enabled.False;
    $("#pbsdiagram").orgDiagram(options);
}

function ResizePlaceholder(diagramDiv) {
    /*       var bodyWidth = $(window).width() - 200
     var bodyHeight = $(window).height() - 200
     jQuery("#orgdiagram").css(
     {
     "width":bodyWidth + "px",
     "height":bodyHeight + "px"
     });*/
    jQuery(diagramDiv).addClass('span11');

}

$(function () {
    $.fn.editable.defaults.mode = 'popup';
    $('.editable-assignedUser').editable({
        value:2,
        source:[
            {value:1, text:'郭奕'},
            {value:2, text:'成仔'}
        ]
    });
    $('.editable-participants').editable({
        value:2,
        source:[
            {value:1, text:'郭奕'},
            {value:2, text:'成仔'}
        ]
    });

    $('.editable-endDate').editable({
        datepicker:{
            weekStart:1
        }
    });


    $('table#myDataTable').dataTable({
        "sDom":"<'row-fluid'<'span4 taskoperation'><'span4'l><'span4'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
        "sPaginationType":"bootstrap",
        "oLanguage":{
            "sLengthMenu":"_MENU_ 条记录/页",
            "sSearch":"搜索:",
            "sInfo":"从_START_到_END_, 共有_TOTAL_条记录",
            "sInfoEmpty":"0条记录"
        },
        "bRetrieve":true,
        "bDestroy":true
    });


    $('div.taskoperation').append(
        $('div.tableMenu').html()
    );

});

