<script type="text/javascript">

    $(document).ready(function(){
        $('#fullCalendar').fullCalendar({
            header: {    left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'},
            columnFormat: { week: 'ddd d/M' },
            timeFormat: 'HH:mm{ - HH:mm}',
            events: function(start, end, callback){
                $.getJSON("listAsJson",
                         {start: start.getTime(), end: end.getTime()},
                function(result) {
                    for(var i=0; i<result.length; i++){
                        result[i].start = $.fullCalendar.parseISO8601(result[i].start, true);
                        result[i].end = $.fullCalendar.parseISO8601(result[i].end, true);
                    }
                    callback(result);
                });
            },
            eventRender: function(calEvent, element) {
                // event render to show the detail of the tasks
            }
        })
    });
</script>
<div id="fullCalendar"></div>
