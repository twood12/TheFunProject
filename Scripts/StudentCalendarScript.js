$(document).ready(function () {
    displayCalendar();
    //$('#calendar').children('.fc-content').children().append('<div id="trashCan"></div>');
});

function displayCalendar() {
    $.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: "{}",
        url: "CalendarService.asmx/getEventList",
        dataType: "json",
        success: function (data) {
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                selectable: true,
                selectHelper: true,
                select: function (start, end) {
                    showPopUp(start, end);
                },
                editable: false,
                droppable: false,
                draggable: false,
                lazyFetching: false,
                defaultTimedEventDuration: '01:00:00',
                forceEventDuration: true,
                eventTextColor: 'White',
                //eventBackgroundColor: 'Purple',
                events:
                $.map(data.d, function (item, i) {
                    console.log(item);
                   console.log(item);
                    var eventEndDate = new Object();
                    var event = new Object();
                    event.id = item.eventID,
                    event.start = new Date(item.eventStartDate),
                    event.end = new Date(item.eventEndDate),
                    event.title = item.eventTitle,
                    event.description = item.eventDescription,
                    event.topic = item.eventTopic,
                    event.allDay = false;
                    console.log(event);
                    return event;
                }),
                eventRender: function (event, element) {
                    //element.attr("Topic", event.description),
                    element.qtip({
                        content: event.title + "<br>" + event.start.format('MM-DD h:mm') + " - " + event.end.format('MM-DD h:mm'),
                        position: { corner: { tootltip: 'bottomLeft', target: 'topRight' } },
                        style: {
                            border: {
                                width: 1,
                                radius: 3,
                                color: 'green'
                            },
                            padding: 10,
                            textAlign: 'left',
                            tip: true
                        }
                    });

                    switch (event.topic) {
                        case 'MC':
                            //element.children('.fc-event-inner').css({ 'background-color': 'magenta' });
                            element.addClass('MC');
                            //event.className = 'MC';
                            break;
                        case 'B-Boy':
                            element.addClass('B-Boy');
                            break;
                        case 'DJ':
                            element.addClass('DJ');
                            break;
                        case 'Graffiti':
                            element.addClass('Graffiti');
                            break;
                        case 'General':
                            element.addClass('General');
                            break;
                        case 'Community Service':
                            element.addClass('Community-Service');
                            break;
                        default:
                            element.addClass('General');
                            break;
                    }
                },
                eventAfterRender: function (event, element, view) {
                    if ($(this).data("qtip")) $(this).qtip('destroy');
                },
                eventResize: function (event, dayDelta, minuteDelta, revertFunc) {
                    if ($(this).data("qtip")) $(this).qtip('destroy');
                    //alert(event.title + " end time is now " + event.end.format('YYYY-MM-DD h:mm:ss'));
                    if (!confirm("Are you sure you want to change " + event.title + "'s time to "
                        + event.end.format('YYYY-MM-DD h:mm:ss'))) {
                        revertFunc();
                    }
                    else {
                        updateEvent(event);
                    }
                },
                eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc) {
                    if ($(this).data("qtip")) $(this).qtip('destroy');
                    if (!confirm("Are you sure you want to change " + event.title + "'s date to "
                        + event.start.format('YYYY-MM-DD h:mm:ss') + " - " + event.end.format('YYYY-MM-DD h:mm:ss'))) {
                        revertFunc();
                    }
                    else {
                        updateEvent(event);
                    }
                    if ($(this).data("qtip")) $(this).qtip('destroy');
                },
                eventDurationEditable: false, // change an events duration by dragging!
                disableResizing: true,
                startEditable: false,
                eventAfterAllRender: function (view) { },
                drop: function (date) {
                    eventDropped(date, this);
                },
                eventReceive: function (event) {
                    updateEvent(event);
                },
                eventClick: function (event) {
                    showEventClickedPopUp(event);
                },
                eventDestroy(event, element, view) { },
                //eventDragStop: function (event, jsEvent) {
                //    var trash = jQuery('#trashCan');
                //    var ofs = trash.offset();
                //    var x1 = ofs.left;
                //    var x2 = ofs.left + trash.outerWidth(true);
                //    var y1 = ofs.top;
                //    var y2 = ofs.top + trash.outerHeight(true);

                //    if (jsEvent.pageX >= x1 && jsEvent.pageX <= x2 && jsEvent.pageY >= y1 && jsEvent.pageY <= y2) {
                //        deleteEvent(event);
                //    }
                //},
                //dragRevertDuration: 0,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    debugger;
                }
            });
        }
    });
}

function showEventClickedPopUp(event) {
    $("#eventInfoDialog").dialog({
        autoOpen: false,
        height: 400,
        width: 400,
        show: {
            effect: "blind",
            duration: 1000,
        },
        hide: {
            effect: "explode",
            duration: 1000
        },
    });

    document.getElementById('eventTitle').innerHTML = "<p>Event Title: " + event.title + "</ br></p>";
    document.getElementById('eventTopic').innerHTML = "<p>Event Topic: " + event.topic + "</ br></p>";
    document.getElementById('eventStartDate').innerHTML = "<p>Start Time: " + event.start + "</ br></p>";
    document.getElementById('eventEndDate').innerHTML = "<p>End Time: " + event.end + "</ br></p>";
    document.getElementById('eventDescription').innerHTML = "<p>Event Description: " + event.description + "</ br></p>";

    $('#eventInfoDialog').dialog('open');

}
