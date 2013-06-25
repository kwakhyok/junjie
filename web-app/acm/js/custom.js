/*FIlE NAME: custom.js*/

/* -------------------- Check Browser --------------------- */

function browser() {

    var isOpera = !!(window.opera && window.opera.version);  // Opera 8.0+
    var isFirefox = testCSS('MozBoxSizing');                 // FF 0.8+
    var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0;
    // At least Safari 3+: "[object HTMLElementConstructor]"
    var isChrome = !isSafari && testCSS('WebkitTransform');  // Chrome 1+
    //var isIE = /*@cc_on!@*/false || testCSS('msTransform');  // At least IE6

    function testCSS(prop) {
        return prop in document.documentElement.style;
    }

    if (isOpera) {

        return false;

    } else if (isSafari || isChrome) {

        return true;

    } else {

        return false;

    }

}

/* ---------- IE8 list style hack (:nth-child(odd)) ---------- */

jQuery(document).ready(function ($) {

    if ($('.messagesList').width()) {

        if (jQuery.browser.version.substring(0, 2) == "8.") {

            $('ul.messagesList li:nth-child(2n+1)').addClass('odd');

        }

    }

});


$(document).ready(function () {


    $("#username").focus(function () {

        $(this).parent(".input-prepend").addClass("input-prepend-focus");

    });

    $("#username").focusout(function () {

        $(this).parent(".input-prepend").removeClass("input-prepend-focus");

    });

    $("#password").focus(function () {

        $(this).parent(".input-prepend").addClass("input-prepend-focus");

    });

    $("#password").focusout(function () {

        $(this).parent(".input-prepend").removeClass("input-prepend-focus");

    });

/*

    */
/* ---------- Add class .active to current link  ---------- *//*

    $('ul.main-menu li a').each(function () {

        if ($(this).hasClass('submenu')) {

            if ($($(this))[0].href == String(window.location)) {

                $(this).parent().parent().parent().addClass('active');

            }

        } else {

            if ($($(this))[0].href == String(window.location)) {

                $(this).parent().addClass('active');

            }

        }


    });
*/


    /* ---------- Acivate Functions ---------- */
    template_functions();
    sparkline_charts();
    charts();
    calendars();
    growlLikeNotifications();
    widthFunctions();

    if (jQuery.browser.version.substring(0, 2) == "8.") {

        //disable jQuery Knob

    } else {

        circle_progess();

    }

    chart();
    messageLike();

    setInterval(tempStats, 3000);
    //tempStats();


});

/* ---------- Like/Dislike ---------- */

function messageLike() {

    if ($('.messagesList')) {

        $('.messagesList').on('click', '.star', function () {

            $(this).removeClass('star');

            $(this).addClass('dislikes');

            //here add your function

        });

        $('.messagesList').on('click', '.dislikes', function () {

            $(this).removeClass('dislikes');

            $(this).addClass('star');

            //here add your function

        });


    }


}

/* ---------- Check Retina ---------- */

function retina() {

    retinaMode = (window.devicePixelRatio > 1);

    return retinaMode;

}

/* ---------- Temp Stats ---------- */

function tempStats() {

    if ($('.tempStat')) {

        $('.tempStat').each(function () {

            var temp = Math.floor(Math.random() * (1 + 120));

            $(this).html(temp + '°');

            if (temp < 20) {

                $(this).animate({
                    borderColor:"#67c2ef"
                }, 'fast');

            } else if (temp > 19 && temp < 40) {

                $(this).animate({
                    borderColor:"#CBE968"
                }, 'slow');

            } else if (temp > 39 && temp < 60) {

                $(this).animate({
                    borderColor:"#eae874"
                }, 'slow');

            } else if (temp > 59 && temp < 80) {

                $(this).animate({
                    borderColor:"#fabb3d"
                }, 'slow');

            } else if (temp > 79 && temp < 100) {

                $(this).animate({
                    borderColor:"#fa603d"
                }, 'slow');

            } else {

                $(this).animate({
                    borderColor:"#ff5454"
                }, 'slow');

            }

        });

    }

}

/* ---------- Chart ---------- */

function chart() {

    if ($('.verticalChart')) {

        $('.singleBar').each(function () {

            var percent = $(this).find('.value span').html();

            $(this).find('.value').animate({height:percent}, 2000, function () {

                $(this).find('span').fadeIn();

            });

        });

    }

}

/* ---------- Widget Area Functions ---------- */
function widget_area_functions() {

    /* ---------- Just Gage Charts ---------- */

    var g1;

    setInterval(function() {
        g1.refresh(getRandomInt(65, 68));
    }, 2500);

    var g1 = new JustGage({
        id: "overview-percentage",
        value: getRandomInt(65, 68),
        min: 0,
        max: 100,
        title: "项目总体完成情况",
        label: "百分比",
        levelColorsGradient: false
    });

    /* ---------- Bar Stats ---------- */

    if (retina()) {

        $(".bar-stat > .chart").each(function(){

            var chartColor = $(this).css('color');

            $(this).sparkline('html', {
                    type: 'bar',
                    height: '80', // Double pixel number for retina display
                    barWidth: '10', // Double pixel number for retina display
                    barSpacing: '4', // Double pixel number for retina display
                    barColor: chartColor,
                    negBarColor: '#eeeeee'}
            );

            $(this).css('zoom',0.5);

        });

    } else {

        $(".bar-stat > .chart").each(function(){

            var chartColor = $(this).css('color');

            $(this).sparkline('html', {
                    type: 'bar',
                    height: '40',
                    barWidth: '5',
                    barSpacing: '2',
                    barColor: chartColor,
                    negBarColor: '#eeeeee'}
            );

        });

    }

}




/* ---------- Numbers Sepparator ---------- */

function numberWithCommas(x) {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1.$2");
    return x;
}

/* ---------- Template Functions ---------- */

function template_functions() {

    /* ---------- ToDo List Action Buttons ---------- */

    $(".todo-remove").click(function () {

        $(this).parent().parent().fadeTo("slow", 0.00, function () { //fade
            $(this).slideUp("slow", function () { //slide up
                $(this).remove(); //then remove from the DOM
            });
        });


        return false;
    });

    /* ---------- Skill Bars ---------- */
    $(".meter > span").each(function () {
        $(this)
            .data("origWidth", $(this).width())
            .width(0)
            .animate({
                width:$(this).data("origWidth")
            }, 3000);
    });

    /* ---------- Disable moving to top ---------- */
    $('a[href="#"][data-top!=true]').click(function (e) {
        e.preventDefault();
    });

    /* ---------- Text editor ---------- */
    $('.cleditor').cleditor({});


    /* ---------- Datapicker ---------- */
    //  $('.datepicker').datepicker();


    /* ---------- Notifications ---------- */
    $('.noty').click(function (e) {
        e.preventDefault();
        var options = $.parseJSON($(this).attr('data-noty-options'));
        noty(options);
    });

    /* ---------- Uniform ---------- */
    $("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();

    /* ---------- Choosen ---------- */
    $('[data-rel="chosen"],[rel="chosen"]').chosen(

    );

    /* ---------- Tabs ---------- */
    $('#myTab a:first').tab('show');
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    /* ---------- Makes elements soratble, elements that sort need to have id attribute to save the result ---------- */
    $('.sortable').sortable({
        revert:true,
        cancel:'.btn,.box-content,.nav-header',
        update:function (event, ui) {
            //line below gives the ids of elements, you can make ajax call here to save it to the database
            //console.log($(this).sortable('toArray'));
        }
    });

    /* ---------- Tooltip ---------- */
    $('[rel="tooltip"],[data-rel="tooltip"]').tooltip({"placement":"bottom", delay:{ show:400, hide:200 }});

    /* ---------- Popover ---------- */
    $('[rel="popover"],[data-rel="popover"]').popover();

    /* ---------- File Manager ---------- */
    var elf = $('.file-manager').elfinder({
        url:'misc/elfinder-connector/connector.php'  // connector URL (REQUIRED)
    }).elfinder('instance');

    /* ---------- Star Rating ---------- */
    $('.raty').raty({
        score:4 //default stars
    });

    /* ---------- Uploadify ---------- */
    $('#file_upload').uploadify({
        'swf':'misc/uploadify.swf',
        'uploader':'misc/uploadify.php'
        // Put your options here
    });

    /* ---------- Fullscreen ---------- */
    $('#toggle-fullscreen').button().click(function () {
        var button = $(this), root = document.documentElement;
        if (!button.hasClass('active')) {
            $('#thumbnails').addClass('modal-fullscreen');
            if (root.webkitRequestFullScreen) {
                root.webkitRequestFullScreen(
                    window.Element.ALLOW_KEYBOARD_INPUT
                );
            } else if (root.mozRequestFullScreen) {
                root.mozRequestFullScreen();
            }
        } else {
            $('#thumbnails').removeClass('modal-fullscreen');
            (document.webkitCancelFullScreen ||
                document.mozCancelFullScreen ||
                $.noop).apply(document);
        }
    });


    /* ---------- Datable ---------- */
    $('.datatable').dataTable({
        "sDom":"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
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

    $('table.myDataTable').dataTable({
        "sDom":"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
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




    /*------------------------------Datatable customization finished ----------------*/


    $('.btn-close').click(function (e) {
        e.preventDefault();
        $(this).parent().parent().parent().fadeOut();
    });
    $('.btn-minimize').click(function (e) {
        e.preventDefault();
        var $target = $(this).parent().parent().next('.box-content');
        if ($target.is(':visible')) $('i', $(this)).removeClass('icon-chevron-up').addClass('icon-chevron-down');
        else                        $('i', $(this)).removeClass('icon-chevron-down').addClass('icon-chevron-up');
        $target.slideToggle();
    });
    $('.btn-setting').click(function (e) {
        e.preventDefault();
        $('#myModal').modal('show');
    });


    /* ---------- Progress  ---------- */

    $(".simpleProgress").progressbar({
        value:89
    });

    $(".progressAnimate").progressbar({
        value:1,
        create:function () {
            $(".progressAnimate .ui-progressbar-value").animate({"width":"100%"}, {
                duration:10000,
                step:function (now) {
                    $(".progressAnimateValue").html(parseInt(now) + "%");
                },
                easing:"linear"
            })
        }
    });

    $(".progressUploadAnimate").progressbar({
        value:1,
        create:function () {
            $(".progressUploadAnimate .ui-progressbar-value").animate({"width":"100%"}, {
                duration:20000,
                easing:'linear',
                step:function (now) {
                    $(".progressUploadAnimateValue").html(parseInt(now * 40.96) + " Gb");
                },
                complete:function () {
                    $(".progressUploadAnimate + .field_notice").html("<span class='must'>Upload Finished</span>");
                }
            })
        }
    });

    if ($(".taskProgress")) {

        $(".taskProgress").each(function () {

            var endValue = parseInt($(this).html());

            $(this).progressbar({
                value:endValue
            });

            $(this).parent().find(".percent").html(endValue + "%");

        });

    }

    if ($(".progressBarValue")) {

        $(".progressBarValue").each(function () {

            var endValueHTML = $(this).find(".progressCustomValueVal").html();

            var endValue = parseInt(endValueHTML);

            $(this).find(".progressCustomValue").progressbar({

                value:1,
                create:function () {
                    $(this).find(".ui-progressbar-value").animate({"width":endValue + "%"}, {
                        duration:5000,
                        step:function (now) {

                            $(this).parent().parent().parent().find(".progressCustomValueVal").html(parseInt(now) + "%");
                        },
                        easing:"linear"
                    })
                }
            });

        });

    }


    /* ---------- Custom Slider ---------- */
    $(".sliderSimple").slider();

    $(".sliderMin").slider({
        range:"min",
        value:10,
        min:1,
        max:100,
        slide:function (event, ui) {
            $(".sliderMinLabel").html(ui.value + "%");
        }
    });

    $(".sliderMin-1").slider({
        range:"min",
        value:50,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderMin1Label").html("$" + ui.value);
        }
    });

    $(".sliderMin-2").slider({
        range:"min",
        value:100,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderMin2Label").html("$" + ui.value);
        }
    });

    $(".sliderMin-3").slider({
        range:"min",
        value:150,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderMin3Label").html("$" + ui.value);
        }
    });

    $(".sliderMin-4").slider({
        range:"min",
        value:250,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderMin4Label").html("$" + ui.value);
        }
    });

    $(".sliderMin-5").slider({
        range:"min",
        value:350,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderLabel").html("$" + ui.value);
        }
    });

    $(".sliderMin-6").slider({
        range:"min",
        value:450,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderLabel").html("$" + ui.value);
        }
    });

    $(".sliderMin-7").slider({
        range:"min",
        value:550,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderLabel").html("$" + ui.value);
        }
    });

    $(".sliderMin-8").slider({
        range:"min",
        value:650,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderLabel").html("$" + ui.value);
        }
    });


    $(".sliderMax").slider({
        range:"max",
        value:280,
        min:1,
        max:700,
        slide:function (event, ui) {
            $(".sliderMaxLabel").html("$" + ui.value);
        }
    });

    $(".sliderRange").slider({
        range:true,
        min:0,
        max:500,
        values:[ 192, 470 ],
        slide:function (event, ui) {
            $(".sliderRangeLabel").html("$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ]);
        }
    });

    $("#sliderVertical-1").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:60
    });

    $("#sliderVertical-2").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:40
    });

    $("#sliderVertical-3").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:30
    });

    $("#sliderVertical-4").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:15
    });

    $("#sliderVertical-5").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:40
    });

    $("#sliderVertical-6").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:80
    });

    $("#sliderVertical-7").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:60
    });

    $("#sliderVertical-8").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:40
    });

    $("#sliderVertical-9").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:30
    });

    $("#sliderVertical-10").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:15
    });

    $("#sliderVertical-11").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:40
    });

    $("#sliderVertical-12").slider({
        orientation:"vertical",
        range:"min",
        min:0,
        max:100,
        value:80
    });

}

/* ---------- Circle Progess Bars ---------- */

function circle_progess() {

    var divElement = $('div'); //log all div elements

    if (retina()) {

        $(".whiteCircle").knob({
            'min':0,
            'max':100,
            'readOnly':true,
            'width':240,
            'height':240,
            'bgColor':'rgba(255,255,255,0.5)',
            'fgColor':'rgba(255,255,255,0.9)',
            'dynamicDraw':true,
            'thickness':0.2,
            'tickColorizeValues':true
        });

        $(".circleStat").css('zoom', 0.5);
        $(".whiteCircle").css('zoom', 0.999);


    } else {

        $(".whiteCircle").knob({
            'min':0,
            'max':100,
            'readOnly':true,
            'width':120,
            'height':120,
            'bgColor':'rgba(255,255,255,0.5)',
            'fgColor':'rgba(255,255,255,0.9)',
            'dynamicDraw':true,
            'thickness':0.2,
            'tickColorizeValues':true
        });

    }


    $(".circleStatsItemBox").each(function () {

        var value = $(this).find(".value > .number").html();
        var unit = $(this).find(".value > .unit").html();
        var percent = $(this).find("input").val() / 100;

        countSpeed = 2300 * percent;

        endValue = value * percent;

        $(this).find(".count > .unit").html(unit);
        $(this).find(".count > .number").countTo({

            from:0,
            to:endValue,
            speed:countSpeed,
            refreshInterval:50,
            onComplete:function (value) {
                console.debug(this);
            }

        });

        //$(this).find(".count").html(value*percent + unit);

    });

    $(".greenCircle").knob({
        'min':0,
        'max':100,
        'readOnly':true,
        'width':120,
        'height':120,
        'fgColor':'#b9e672',
        'dynamicDraw':true,
        'thickness':0.2,
        'tickColorizeValues':true,
        'skin':'tron'
    })

    $(".orangeCircle").knob({
        'min':0,
        'max':100,
        'readOnly':true,
        'width':120,
        'height':120,
        'fgColor':'#FA5833',
        'dynamicDraw':true,
        'thickness':0.2,
        'tickColorizeValues':true,
        'skin':'tron'
    })

    $(".lightOrangeCircle").knob({
        'min':0,
        'max':100,
        'readOnly':true,
        'width':120,
        'height':120,
        'fgColor':'#f4a70c',
        'dynamicDraw':true,
        'thickness':0.2,
        'tickColorizeValues':true,
        'skin':'tron'
    })

    $(".blueCircle").knob({
        'min':0,
        'max':100,
        'readOnly':true,
        'width':120,
        'height':120,
        'fgColor':'#2FABE9',
        'dynamicDraw':true,
        'thickness':0.2,
        'tickColorizeValues':true,
        'skin':'tron'
    })

    $(".yellowCircle").knob({
        'min':0,
        'max':100,
        'readOnly':true,
        'width':120,
        'height':120,
        'fgColor':'#e7e572',
        'dynamicDraw':true,
        'thickness':0.2,
        'tickColorizeValues':true,
        'skin':'tron'
    })

    $(".pinkCircle").knob({
        'min':0,
        'max':100,
        'readOnly':true,
        'width':120,
        'height':120,
        'fgColor':'#e42b75',
        'dynamicDraw':true,
        'thickness':0.2,
        'tickColorizeValues':true,
        'skin':'tron'
    })


}


/* ---------- Calendars ---------- */

function calendars() {


    $('#external-events div.external-event').each(function () {

        // it doesn't need to have a start or end
        var eventObject = {
            title:$.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex:999,
            revert:true, // will cause the event to go back to its
            revertDuration:0  //  original position after the drag
        });

    });

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#main_calendar').fullCalendar({
        header:{
            left:'title',
            right:'prev,next today,month,agendaWeek,agendaDay'
        },
        editable:true,
        events:[
            {
                title:'All Day Event',
                start:new Date(y, m, 1)
            },
            {
                title:'Long Event',
                start:new Date(y, m, d - 5),
                end:new Date(y, m, d - 2)
            },
            {
                id:999,
                title:'Repeating Event',
                start:new Date(y, m, d - 3, 16, 0),
                allDay:false
            },
            {
                id:999,
                title:'Repeating Event',
                start:new Date(y, m, d + 4, 16, 0),
                allDay:false
            },
            {
                title:'Meeting',
                start:new Date(y, m, d, 10, 30),
                allDay:false
            },
            {
                title:'Lunch',
                start:new Date(y, m, d, 12, 0),
                end:new Date(y, m, d, 14, 0),
                allDay:false
            },
            {
                title:'Birthday Party',
                start:new Date(y, m, d + 1, 19, 0),
                end:new Date(y, m, d + 1, 22, 30),
                allDay:false
            },
            {
                title:'Click for Google',
                start:new Date(y, m, 28),
                end:new Date(y, m, 29),
                url:'http://google.com/'
            }
        ]
    });

    $('#main_calendar_phone').fullCalendar({
        header:{
            left:'title',
            right:'prev,next'
        },
        defaultView:'month',
        editable:true,
        events:[
            {
                title:'全天接待区领导',
                start:new Date(y, m, 1)
            },
            {
                title:'三天漏水事件验收',
                start:new Date(y, m, d - 5),
                end:new Date(y, m, d - 2)
            },
            {
                id:999,
                title:'每周例会',
                start:new Date(y, m, d - 3, 16, 0),
                allDay:false
            },
            {
                id:999,
                title:'每月例会',
                start:new Date(y, m, d + 4, 16, 0),
                allDay:false
            },
            {
                title:'总包碰头会',
                start:new Date(y, m, d, 10, 30),
                allDay:false
            },
            {
                title:'工程部商务午餐',
                start:new Date(y, m, d, 12, 0),
                end:new Date(y, m, d, 14, 0),
                allDay:false
            },
            {
                title:'PVC招标收尾',
                start:new Date(y, m, d + 1, 19, 0),
                end:new Date(y, m, d + 1, 22, 30),
                allDay:false
            },
            {
                title:'查询最新政策',
                start:new Date(y, m, 28),
                end:new Date(y, m, 29),
                url:'http://google.com/'
            }
        ]
    });


    $('#calendar').fullCalendar({
        header:{
            left:'title',
            right:'prev,next today,month,agendaWeek,agendaDay'
        },
        editable:true,
        droppable:true, // this allows things to be dropped onto the calendar !!!
        drop:function (date, allDay) { // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }

        }
    });

}

/* ---------- Sparkline Charts ---------- */

function sparkline_charts() {

    //generate random number for charts
    randNum = function () {
        //return Math.floor(Math.random()*101);
        return (Math.floor(Math.random() * (1 + 40 - 20)) ) + 20;
    }

    var chartColours = ['#2FABE9', '#FA5833', '#b9e672', '#bbdce3', '#9a3b1b', '#5a8022', '#2c7282'];

    //sparklines (making loop with random data for all 7 sparkline)
    i = 1;
    for (i = 1; i < 9; i++) {
        var data = [
            [1, 3 + randNum()],
            [2, 5 + randNum()],
            [3, 8 + randNum()],
            [4, 11 + randNum()],
            [5, 14 + randNum()],
            [6, 17 + randNum()],
            [7, 20 + randNum()],
            [8, 15 + randNum()],
            [9, 18 + randNum()],
            [10, 22 + randNum()]
        ];
        placeholder = '.sparkLineStats' + i;

        if (retina()) {

            $(placeholder).sparkline(data, {
                width:200, //Width of the chart - Defaults to 'auto' - May be any valid css width - 1.5em, 20px, etc (using a number without a unit specifier won't do what you want) - This option does nothing for bar and tristate chars (see barWidth)
                height:60, //Height of the chart - Defaults to 'auto' (line height of the containing tag)
                lineColor:'#2FABE9', //Used by line and discrete charts to specify the colour of the line drawn as a CSS values string
                fillColor:'#f2f7f9', //Specify the colour used to fill the area under the graph as a CSS value. Set to false to disable fill
                spotColor:'#467e8c', //The CSS colour of the final value marker. Set to false or an empty string to hide it
                maxSpotColor:'#b9e672', //The CSS colour of the marker displayed for the maximum value. Set to false or an empty string to hide it
                minSpotColor:'#FA5833', //The CSS colour of the marker displayed for the mimum value. Set to false or an empty string to hide it
                spotRadius:2, //Radius of all spot markers, In pixels (default: 1.5) - Integer
                lineWidth:1//In pixels (default: 1) - Integer
            });

            $(placeholder).css('zoom', 0.5);

        } else {

            $(placeholder).sparkline(data, {
                width:100, //Width of the chart - Defaults to 'auto' - May be any valid css width - 1.5em, 20px, etc (using a number without a unit specifier won't do what you want) - This option does nothing for bar and tristate chars (see barWidth)
                height:30, //Height of the chart - Defaults to 'auto' (line height of the containing tag)
                lineColor:'#2FABE9', //Used by line and discrete charts to specify the colour of the line drawn as a CSS values string
                fillColor:'#f2f7f9', //Specify the colour used to fill the area under the graph as a CSS value. Set to false to disable fill
                spotColor:'#467e8c', //The CSS colour of the final value marker. Set to false or an empty string to hide it
                maxSpotColor:'#b9e672', //The CSS colour of the marker displayed for the maximum value. Set to false or an empty string to hide it
                minSpotColor:'#FA5833', //The CSS colour of the marker displayed for the mimum value. Set to false or an empty string to hide it
                spotRadius:2, //Radius of all spot markers, In pixels (default: 1.5) - Integer
                lineWidth:1//In pixels (default: 1) - Integer
            });

        }

    }

}

/* ---------- Charts ---------- */

function charts() {

    function randNum() {
        return ((Math.floor(Math.random() * (1 + 40 - 20)) ) + 20) * 1200;
    }

    function randNum2() {
        return ((Math.floor(Math.random() * (1 + 40 - 20)) ) + 20) * 500;
    }

    function randNum3() {
        return ((Math.floor(Math.random() * (1 + 40 - 20)) ) + 20) * 300;
    }

    function randNum4() {
        return ((Math.floor(Math.random() * (1 + 40 - 20)) ) + 20) * 100;
    }

    /* ---------- Chart with points ---------- */
    if ($("#stats-chart2").length) {
        var pageviews = [
            [1, 5 + randNum()],
            [2, 10 + randNum()],
            [3, 15 + randNum()],
            [4, 20 + randNum()],
            [5, 25 + randNum()],
            [6, 30 + randNum()],
            [7, 35 + randNum()],
            [8, 40 + randNum()],
            [9, 45 + randNum()],
            [10, 50 + randNum()],
            [11, 55 + randNum()],
            [12, 60 + randNum()],
            [13, 65 + randNum()],
            [14, 70 + randNum()],
            [15, 75 + randNum()],
            [16, 80 + randNum()],
            [17, 85 + randNum()],
            [18, 90 + randNum()],
            [19, 85 + randNum()],
            [20, 80 + randNum()],
            [21, 75 + randNum()],
            [22, 80 + randNum()],
            [23, 75 + randNum()],
            [24, 70 + randNum()],
            [25, 65 + randNum()],
            [26, 75 + randNum()],
            [27, 80 + randNum()],
            [28, 85 + randNum()],
            [29, 90 + randNum()],
            [30, 95 + randNum()]
        ];
        var visits = [
            [1, randNum2() - 10],
            [2, randNum2() - 10],
            [3, randNum2() - 10],
            [4, randNum2()],
            [5, randNum2()],
            [6, 4 + randNum2()],
            [7, 5 + randNum2()],
            [8, 6 + randNum2()],
            [9, 6 + randNum2()],
            [10, 8 + randNum2()],
            [11, 9 + randNum2()],
            [12, 10 + randNum2()],
            [13, 11 + randNum2()],
            [14, 12 + randNum2()],
            [15, 13 + randNum2()],
            [16, 14 + randNum2()],
            [17, 15 + randNum2()],
            [18, 15 + randNum2()],
            [19, 16 + randNum2()],
            [20, 17 + randNum2()],
            [21, 18 + randNum2()],
            [22, 19 + randNum2()],
            [23, 20 + randNum2()],
            [24, 21 + randNum2()],
            [25, 14 + randNum2()],
            [26, 24 + randNum2()],
            [27, 25 + randNum2()],
            [28, 26 + randNum2()],
            [29, 27 + randNum2()],
            [30, 31 + randNum2()]
        ];
        var visitors = [
            [1, 5 + randNum3()],
            [2, 10 + randNum3()],
            [3, 15 + randNum3()],
            [4, 20 + randNum3()],
            [5, 25 + randNum3()],
            [6, 30 + randNum3()],
            [7, 35 + randNum3()],
            [8, 40 + randNum3()],
            [9, 45 + randNum3()],
            [10, 50 + randNum3()],
            [11, 55 + randNum3()],
            [12, 60 + randNum3()],
            [13, 65 + randNum3()],
            [14, 70 + randNum3()],
            [15, 75 + randNum3()],
            [16, 80 + randNum3()],
            [17, 85 + randNum3()],
            [18, 90 + randNum3()],
            [19, 85 + randNum3()],
            [20, 80 + randNum3()],
            [21, 75 + randNum3()],
            [22, 80 + randNum3()],
            [23, 75 + randNum3()],
            [24, 70 + randNum3()],
            [25, 65 + randNum3()],
            [26, 75 + randNum3()],
            [27, 80 + randNum3()],
            [28, 85 + randNum3()],
            [29, 90 + randNum3()],
            [30, 95 + randNum3()]
        ];
        var newVisitors = [
            [1, randNum4() - 10],
            [2, randNum4() - 10],
            [3, randNum4() - 10],
            [4, randNum4()],
            [5, randNum4()],
            [6, 4 + randNum4()],
            [7, 5 + randNum4()],
            [8, 6 + randNum4()],
            [9, 6 + randNum4()],
            [10, 8 + randNum4()],
            [11, 9 + randNum4()],
            [12, 10 + randNum4()],
            [13, 11 + randNum4()],
            [14, 12 + randNum4()],
            [15, 13 + randNum4()],
            [16, 14 + randNum4()],
            [17, 15 + randNum4()],
            [18, 15 + randNum4()],
            [19, 16 + randNum4()],
            [20, 17 + randNum4()],
            [21, 18 + randNum4()],
            [22, 19 + randNum4()],
            [23, 20 + randNum4()],
            [24, 21 + randNum4()],
            [25, 14 + randNum4()],
            [26, 24 + randNum4()],
            [27, 25 + randNum4()],
            [28, 26 + randNum4()],
            [29, 27 + randNum4()],
            [30, 31 + randNum4()]
        ];

        var plot = $.plot($("#stats-chart2"),
            [
                { data:visits, label:"Visits"},
                { data:pageviews, label:"Pageviews"},
                { data:visitors, label:"Visitors" },
                { data:newVisitors, label:"New Visitors"}
            ], {
                series:{
                    lines:{ show:true,
                        lineWidth:2
                    },
                    points:{ show:true,
                        lineWidth:2
                    },
                    shadowSize:0
                },
                grid:{ hoverable:true,
                    clickable:true,
                    tickColor:"#f9f9f9",
                    borderWidth:0
                },
                legend:{
                    show:false
                },
                colors:["#bdea74", "#eae874", "#2FABE9", "#FA5833"],
                xaxis:{ticks:15, tickDecimals:0},
                yaxis:{ticks:5, tickDecimals:0}
            });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css({
                position:'absolute',
                display:'none',
                top:y + 5,
                left:x + 5,
                border:'1px solid #fdd',
                padding:'2px',
                'background-color':'#dfeffc',
                opacity:0.80
            }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#stats-chart2").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));

            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);

                    showTooltip(item.pageX, item.pageY,
                        item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });

    }

    function randNumFB() {
        return ((Math.floor(Math.random() * (1 + 40 - 20)) ) + 20);
    }

    /* ---------- Chart with points ---------- */
    if ($("#facebookChart").length) {
        var likes = [
            [1, 5 + randNumFB()],
            [2, 10 + randNumFB()],
            [3, 15 + randNumFB()],
            [4, 20 + randNumFB()],
            [5, 25 + randNumFB()],
            [6, 30 + randNumFB()],
            [7, 35 + randNumFB()],
            [8, 40 + randNumFB()],
            [9, 45 + randNumFB()],
            [10, 50 + randNumFB()],
            [11, 55 + randNumFB()],
            [12, 60 + randNumFB()],
            [13, 65 + randNumFB()],
            [14, 70 + randNumFB()],
            [15, 75 + randNumFB()],
            [16, 80 + randNumFB()],
            [17, 85 + randNumFB()],
            [18, 90 + randNumFB()],
            [19, 85 + randNumFB()],
            [20, 80 + randNumFB()],
            [21, 75 + randNumFB()],
            [22, 80 + randNumFB()],
            [23, 75 + randNumFB()],
            [24, 70 + randNumFB()],
            [25, 65 + randNumFB()],
            [26, 75 + randNumFB()],
            [27, 80 + randNumFB()],
            [28, 85 + randNumFB()],
            [29, 90 + randNumFB()],
            [30, 95 + randNumFB()]
        ];

        var plot = $.plot($("#facebookChart"),
            [
                { data:likes, label:"Fans"}
            ], {
                series:{
                    lines:{ show:true,
                        lineWidth:2,
                        fill:true, fillColor:{ colors:[
                            { opacity:0.5 },
                            { opacity:0.2 }
                        ] }
                    },
                    points:{ show:true,
                        lineWidth:2
                    },
                    shadowSize:0
                },
                grid:{ hoverable:true,
                    clickable:true,
                    tickColor:"#f9f9f9",
                    borderWidth:0
                },
                colors:["#3B5998"],
                xaxis:{ticks:6, tickDecimals:0},
                yaxis:{ticks:3, tickDecimals:0}
            });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css({
                position:'absolute',
                display:'none',
                top:y + 5,
                left:x + 5,
                border:'1px solid #fdd',
                padding:'2px',
                'background-color':'#dfeffc',
                opacity:0.80
            }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#facebookChart").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));

            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);

                    showTooltip(item.pageX, item.pageY,
                        item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });

    }

    function randNumTW() {
        return ((Math.floor(Math.random() * (1 + 40 - 20)) ) + 20);
    }

    /* ---------- Chart with points ---------- */
    if ($("#sincos").length) {
        var sin = [], cos = [];

        for (var i = 0; i < 14; i += 0.5) {
            sin.push([i, Math.sin(i) / i]);
            cos.push([i, Math.cos(i)]);
        }

        var plot = $.plot($("#sincos"),
            [
                { data:sin, label:"sin(x)/x"},
                { data:cos, label:"cos(x)" }
            ], {
                series:{
                    lines:{ show:true,
                        lineWidth:2
                    },
                    points:{ show:true },
                    shadowSize:2
                },
                grid:{ hoverable:true,
                    clickable:true,
                    tickColor:"#dddddd",
                    borderWidth:0
                },
                yaxis:{ min:-1.2, max:1.2 },
                colors:["#FA5833", "#2FABE9"]
            });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css({
                position:'absolute',
                display:'none',
                top:y + 5,
                left:x + 5,
                border:'1px solid #fdd',
                padding:'2px',
                'background-color':'#dfeffc',
                opacity:0.80
            }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#sincos").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));

            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);

                    showTooltip(item.pageX, item.pageY,
                        item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });


        $("#sincos").bind("plotclick", function (event, pos, item) {
            if (item) {
                $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
                plot.highlight(item.series, item.datapoint);
            }
        });
    }


    /* ---------- Stack chart ---------- */
    if ($("#stackchart").length) {
        var d1 = [];
        var d2 = [];
        for (var i = 1; i <= 12; i += 1) {

            var data1 = parseInt(Math.random() * i * 10);
            var data2 = parseInt(Math.random() * i * 10);

            d1.push([i, data1]);

            d2.push([i, data2]);
        }

        var stack = 0, bars = true, lines = false, steps = false;

        function plotWithOptions() {
            $.plot($("#stackchart"), [
                { label:"计划投资", data:d1 },
                { label:"实际投资", data:d2 }
            ], {
                series:{
                    stack:null,
                    lines:{ show:lines, fill:true, steps:steps },
                    bars:{ show:bars, barWidth:0.6 }
                },
                colors:["#FA5833", "#2FABE9"]
            });
        }

        plotWithOptions();


        $(".graphControls input").click(function (e) {
            e.preventDefault();
            bars = $(this).val().indexOf("柱状") != -1;
            lines = $(this).val().indexOf("折线") != -1;
            steps = $(this).val().indexOf("阶梯") != -1;
            plotWithOptions();
        });
    }

    /* ---------- Device chart ---------- */

    var data = [
        { label:"Desktop", data:73},
        { label:"Mobile", data:27}
    ];

    /* ---------- Donut chart ---------- */
    if ($("#deviceChart").length) {
        $.plot($("#deviceChart"), data,
            {
                series:{
                    pie:{
                        innerRadius:0.6,
                        show:true
                    }
                },
                legend:{
                    show:true
                },
                colors:["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
            });
    }

    var data = [
        { label:"iOS", data:20},
        { label:"Android", data:7},
        { label:"Linux", data:11},
        { label:"Mac OSX", data:14},
        { label:"Windows", data:48}
    ];

    /* ---------- Donut chart ---------- */
    if ($("#osChart").length) {
        $.plot($("#osChart"), data,
            {
                series:{
                    pie:{
                        innerRadius:0.6,
                        show:true
                    }
                },
                legend:{
                    show:true
                },
                colors:["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
            });
    }

    /* ---------- Pie chart ---------- */
    var data = [
        { label:"门诊楼", data:12},
        { label:"待摊投资", data:27},
        { label:"其他应收款", data:85},
        { label:"病房楼", data:64},
        { label:"生活区", data:90},
        { label:"其他", data:112}
    ];

    if ($("#piechart").length) {
        $.plot($("#piechart"), data,
            {
                series:{
                    pie:{
                        show:true
                    }
                },
                grid:{
                    hoverable:true,
                    clickable:true
                },
                legend:{
                    show:false
                },
                colors:["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
            });

        function pieHover(event, pos, obj) {
            if (!obj)
                return;
            percent = parseFloat(obj.series.percent).toFixed(2);
            $("#hover").html('<span style="font-weight: bold; color: ' + obj.series.color + '">' + obj.series.label + ' (' + percent + '%)</span>');
        }

        $("#piechart").bind("plothover", pieHover);
    }

    /* ---------- Donut chart ---------- */
    if ($("#donutchart").length) {
        $.plot($("#donutchart"), data,
            {
                series:{
                    pie:{
                        innerRadius:0.5,
                        show:true
                    }
                },
                legend:{
                    show:false
                },
                colors:["#FA5833", "#2FABE9", "#FABB3D", "#78CD51"]
            });
    }


    // we use an inline data source in the example, usually data would
    // be fetched from a server
    var data = [], totalPoints = 300;

    function getRandomData() {
        if (data.length > 0)
            data = data.slice(1);

        // do a random walk
        while (data.length < totalPoints) {
            var prev = data.length > 0 ? data[data.length - 1] : 50;
            var y = prev + Math.random() * 10 - 5;
            if (y < 0)
                y = 0;
            if (y > 100)
                y = 100;
            data.push(y);
        }

        // zip the generated y values with the x values
        var res = [];
        for (var i = 0; i < data.length; ++i)
            res.push([i, data[i]])
        return res;
    }

    // setup control widget
    var updateInterval = 30;
    $("#updateInterval").val(updateInterval).change(function () {
        var v = $(this).val();
        if (v && !isNaN(+v)) {
            updateInterval = +v;
            if (updateInterval < 1)
                updateInterval = 1;
            if (updateInterval > 2000)
                updateInterval = 2000;
            $(this).val("" + updateInterval);
        }
    });

}

function growlLikeNotifications() {

    $('#add-sticky').click(function () {

        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'This is a sticky notice!',
            // (string | mandatory) the text inside the notification
            text:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
            // (string | optional) the image to display on the left
            image:'img/avatar.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky:true,
            // (int | optional) the time you want it to be alive for before fading out
            time:'',
            // (string | optional) the class name you want to apply to that specific message
            class_name:'my-sticky-class'
        });

        // You can have it return a unique id, this can be used to manually remove it later using
        /* ----------
         setTimeout(function(){

         $.gritter.remove(unique_id, {
         fade: true,
         speed: 'slow'
         });

         }, 6000)
         */

        return false;

    });

    $('#add-regular').click(function () {

        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'This is a regular notice!',
            // (string | mandatory) the text inside the notification
            text:'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
            // (string | optional) the image to display on the left
            image:'img/avatar.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky:false,
            // (int | optional) the time you want it to be alive for before fading out
            time:''
        });

        return false;

    });

    $('#add-max').click(function () {

        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'This is a notice with a max of 3 on screen at one time!',
            // (string | mandatory) the text inside the notification
            text:'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
            // (string | optional) the image to display on the left
            image:'img/avatar.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky:false,
            // (function) before the gritter notice is opened
            before_open:function () {
                if ($('.gritter-item-wrapper').length == 3) {
                    // Returning false prevents a new gritter from opening
                    return false;
                }
            }
        });

        return false;

    });

    $('#add-without-image').click(function () {

        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'This is a notice without an image!',
            // (string | mandatory) the text inside the notification
            text:'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.'
        });

        return false;
    });

    $('#add-gritter-light').click(function () {

        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'This is a light notification',
            // (string | mandatory) the text inside the notification
            text:'Just add a "gritter-light" class_name to your $.gritter.add or globally to $.gritter.options.class_name',
            class_name:'gritter-light'
        });

        return false;
    });

    $('#add-with-callbacks').click(function () {

        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'This is a notice with callbacks!',
            // (string | mandatory) the text inside the notification
            text:'The callback is...',
            // (function | optional) function called before it opens
            before_open:function () {
                alert('I am called before it opens');
            },
            // (function | optional) function called after it opens
            after_open:function (e) {
                alert("I am called after it opens: \nI am passed the jQuery object for the created Gritter element...\n" + e);
            },
            // (function | optional) function called before it closes
            before_close:function (e, manual_close) {
                var manually = (manual_close) ? 'The "X" was clicked to close me!' : '';
                alert("I am called before it closes: I am passed the jQuery object for the Gritter element... \n" + manually);
            },
            // (function | optional) function called after it closes
            after_close:function (e, manual_close) {
                var manually = (manual_close) ? 'The "X" was clicked to close me!' : '';
                alert('I am called after it closes. ' + manually);
            }
        });

        return false;
    });

    $('#add-sticky-with-callbacks').click(function () {

        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:'This is a sticky notice with callbacks!',
            // (string | mandatory) the text inside the notification
            text:'Sticky sticky notice.. sticky sticky notice...',
            // Stickeh!
            sticky:true,
            // (function | optional) function called before it opens
            before_open:function () {
                alert('I am a sticky called before it opens');
            },
            // (function | optional) function called after it opens
            after_open:function (e) {
                alert("I am a sticky called after it opens: \nI am passed the jQuery object for the created Gritter element...\n" + e);
            },
            // (function | optional) function called before it closes
            before_close:function (e) {
                alert("I am a sticky called before it closes: I am passed the jQuery object for the Gritter element... \n" + e);
            },
            // (function | optional) function called after it closes
            after_close:function () {
                alert('I am a sticky called after it closes');
            }
        });

        return false;

    });

    $("#remove-all").click(function () {

        $.gritter.removeAll();
        return false;

    });

    $("#remove-all-with-callbacks").click(function () {

        $.gritter.removeAll({
            before_close:function (e) {
                alert("I am called before all notifications are closed.  I am passed the jQuery object containing all  of Gritter notifications.\n" + e);
            },
            after_close:function () {
                alert('I am called after everything has been closed.');
            }
        });
        return false;

    });


}


/* ---------- Additional functions for data table ---------- */
$.fn.dataTableExt.oApi.fnPagingInfo = function (oSettings) {
    return {
        "iStart":oSettings._iDisplayStart,
        "iEnd":oSettings.fnDisplayEnd(),
        "iLength":oSettings._iDisplayLength,
        "iTotal":oSettings.fnRecordsTotal(),
        "iFilteredTotal":oSettings.fnRecordsDisplay(),
        "iPage":Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
        "iTotalPages":Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)
    };
}
$.extend($.fn.dataTableExt.oPagination, {
    "bootstrap":{
        "fnInit":function (oSettings, nPaging, fnDraw) {
            var oLang = oSettings.oLanguage.oPaginate;
            var fnClickHandler = function (e) {
                e.preventDefault();
                if (oSettings.oApi._fnPageChange(oSettings, e.data.action)) {
                    fnDraw(oSettings);
                }
            };

            $(nPaging).addClass('pagination').append(
                '<ul>' +
                    '<li class="prev disabled"><a href="#">&larr; ' + oLang.sPrevious + '</a></li>' +
                    '<li class="next disabled"><a href="#">' + oLang.sNext + ' &rarr; </a></li>' +
                    '</ul>'
            );
            var els = $('a', nPaging);
            $(els[0]).bind('click.DT', { action:"previous" }, fnClickHandler);
            $(els[1]).bind('click.DT', { action:"next" }, fnClickHandler);
        },

        "fnUpdate":function (oSettings, fnDraw) {
            var iListLength = 5;
            var oPaging = oSettings.oInstance.fnPagingInfo();
            var an = oSettings.aanFeatures.p;
            var i, j, sClass, iStart, iEnd, iHalf = Math.floor(iListLength / 2);

            if (oPaging.iTotalPages < iListLength) {
                iStart = 1;
                iEnd = oPaging.iTotalPages;
            }
            else if (oPaging.iPage <= iHalf) {
                iStart = 1;
                iEnd = iListLength;
            } else if (oPaging.iPage >= (oPaging.iTotalPages - iHalf)) {
                iStart = oPaging.iTotalPages - iListLength + 1;
                iEnd = oPaging.iTotalPages;
            } else {
                iStart = oPaging.iPage - iHalf + 1;
                iEnd = iStart + iListLength - 1;
            }

            for (i = 0, iLen = an.length; i < iLen; i++) {
                // remove the middle elements
                $('li:gt(0)', an[i]).filter(':not(:last)').remove();

                // add the new list items and their event handlers
                for (j = iStart; j <= iEnd; j++) {
                    sClass = (j == oPaging.iPage + 1) ? 'class="active"' : '';
                    $('<li ' + sClass + '><a href="#">' + j + '</a></li>')
                        .insertBefore($('li:last', an[i])[0])
                        .bind('click', function (e) {
                            e.preventDefault();
                            oSettings._iDisplayStart = (parseInt($('a', this).text(), 10) - 1) * oPaging.iLength;
                            fnDraw(oSettings);
                        });
                }

                // add / remove disabled classes from the static elements
                if (oPaging.iPage === 0) {
                    $('li:first', an[i]).addClass('disabled');
                } else {
                    $('li:first', an[i]).removeClass('disabled');
                }

                if (oPaging.iPage === oPaging.iTotalPages - 1 || oPaging.iTotalPages === 0) {
                    $('li:last', an[i]).addClass('disabled');
                } else {
                    $('li:last', an[i]).removeClass('disabled');
                }
            }
        }
    }
});



/* ---------- Page width functions ---------- */

$(window).bind("resize", widthFunctions);

function widthFunctions(e) {

    var winHeight = $(window).height();
    var winWidth = $(window).width();

    var contentHeight = $("#content").height();

    if (winHeight) {

        $("#content").css("min-height", winHeight);

    }

    if (contentHeight) {

        $("#sidebar-left2").css("height", contentHeight);

    }

    if (winWidth < 980 && winWidth > 767) {

        if ($(".main-menu-span").hasClass("span2")) {

            $(".main-menu-span").removeClass("span2");
            $(".main-menu-span").addClass("span1");

        }

        if ($("#content").hasClass("span10")) {

            $("#content").removeClass("span10");
            $("#content").addClass("span11");

        }


        $("a").each(function () {

            if ($(this).hasClass("quick-button-small span1")) {

                $(this).removeClass("quick-button-small span1");
                $(this).addClass("quick-button span2 changed");

            }

        });

        $(".circleStatsItem, .circleStatsItemBox").each(function () {

            var getOnTablet = $(this).parent().attr('onTablet');
            var getOnDesktop = $(this).parent().attr('onDesktop');

            if (getOnTablet) {

                $(this).parent().removeClass(getOnDesktop);
                $(this).parent().addClass(getOnTablet);

            }

        });

        $(".tempStatBox").each(function () {

            var getOnTablet = $(this).attr('onTablet');
            var getOnDesktop = $(this).attr('onDesktop');

            if (getOnTablet) {

                $(this).removeClass(getOnDesktop);
                $(this).addClass(getOnTablet);

            }

        });

        $(".box").each(function () {

            var getOnTablet = $(this).attr('onTablet');
            var getOnDesktop = $(this).attr('onDesktop');

            if (getOnTablet) {

                $(this).removeClass(getOnDesktop);
                $(this).addClass(getOnTablet);

            }

        });

        $(".widget").each(function () {

            var getOnTablet = $(this).attr('onTablet');
            var getOnDesktop = $(this).attr('onDesktop');

            if (getOnTablet) {

                $(this).removeClass(getOnDesktop);
                $(this).addClass(getOnTablet);

            }

        });

    } else {

        if ($(".main-menu-span").hasClass("span1")) {

            $(".main-menu-span").removeClass("span1");
            $(".main-menu-span").addClass("span2");

        }

        if ($("#content").hasClass("span11")) {

            $("#content").removeClass("span11");
            $("#content").addClass("span11");

        }

        $("a").each(function () {

            if ($(this).hasClass("quick-button span2 changed")) {

                $(this).removeClass("quick-button span2 changed");
                $(this).addClass("quick-button-small span1");

            }

        });

        $(".circleStatsItem, .circleStatsItemBox").each(function () {

            var getOnTablet = $(this).parent().attr('onTablet');
            var getOnDesktop = $(this).parent().attr('onDesktop');

            if (getOnTablet) {

                $(this).parent().removeClass(getOnTablet);
                $(this).parent().addClass(getOnDesktop);

            }

        });

        $(".tempStatBox").each(function () {

            var getOnTablet = $(this).attr('onTablet');
            var getOnDesktop = $(this).attr('onDesktop');

            if (getOnTablet) {

                $(this).removeClass(getOnTablet);
                $(this).addClass(getOnDesktop);

            }

        });

        $(".box").each(function () {

            var getOnTablet = $(this).attr('onTablet');
            var getOnDesktop = $(this).attr('onDesktop');

            if (getOnTablet) {

                $(this).removeClass(getOnTablet);
                $(this).addClass(getOnDesktop);

            }

        });

        $(".widget").each(function () {

            var getOnTablet = $(this).attr('onTablet');
            var getOnDesktop = $(this).attr('onDesktop');

            if (getOnTablet) {

                $(this).removeClass(getOnTablet);
                $(this).addClass(getOnDesktop);

            }

        });

    }

    if ($('.timeline')) {

        $('.timeslot').each(function () {

            var timeslotHeight = $(this).find('.task').outerHeight();

            $(this).css('height', timeslotHeight);

        });

    }

}