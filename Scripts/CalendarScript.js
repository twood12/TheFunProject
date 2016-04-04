$(document).ready(function () {
    intDroppables();
    displayCalendar();
});

var maxEventID;
var placeSearch, autoComplete, place;

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
                editable: true,
                droppable: true,
                draggable: true,
                lazyFetching: false,
                defaultTimedEventDuration: '01:00:00',
                forceEventDuration: true,
                eventTextColor: 'White',
                events:
                $.map(data.d, function (item, i) {
                    console.log(item);
                    var eventEndDate = new Object();
                    var event = new Object();
                    event.id = item.eventID,
                    event.start = new Date(item.eventStartDate),
                    event.end = new Date(item.eventEndDate),
                    event.title = item.eventTitle,
                    event.description = item.eventDescription,
                    event.placeID = item.eventPlaceID,
                    event.topic = item.eventTopic,
                    event.allDay = false;
                    console.log(event);
                    return event;
                }),
                eventRender: function (event, element) {
                    element.qtip({
                        content: event.title + "<br>" + event.start.format('MM-DD h:mm') + " - " +
                            event.end.format('MM-DD h:mm'),
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
                            element.addClass('MC');
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
                eventDurationEditable: true, // change an events duration by dragging!
                disableResizing: true,
                startEditable: true,
                eventAfterAllRender: function (view) { },
                drop: function (date) {
                    eventDropped(date, this);
                },
                eventClick: function (event) {
                    showEventClickedPopUp(event);
                },
                eventDestroy(event, element, view) { },
                eventDragStop: function (event, jsEvent) {
                    var trash = jQuery('#trashCan');
                    var ofs = trash.offset();
                    var x1 = ofs.left;
                    var x2 = ofs.left + trash.outerWidth(true);
                    var y1 = ofs.top;
                    var y2 = ofs.top + trash.outerHeight(true);

                    if (jsEvent.pageX >= x1 && jsEvent.pageX <= x2 && jsEvent.pageY >= y1 && jsEvent.pageY <= y2) {
                        deleteEvent(event);
                    }
                },
                dragRevertDuration: 0,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    debugger;
                }
            });
        }
    });
}

function updateEvent(event) {
    var eventToSave = new Object();
    eventToSave.eventID = event.id;
    eventToSave.eventTitle = event.title;
    eventToSave.eventStartDate = event.start.format('YYYY-MM-DD h:mm:ss');
    eventToSave.eventEndDate = event.start.add(1, 'h').format('YYYY-MM-DD h:mm:ss');
    eventToSave.eventTopic = event.topic,
    eventToSave.eventPlaceID = event.placeID;
    eventToSave.eventDescription = event.description;

    $.ajax({
        type: "POST",
        contentType: "application/json",
        data: "{eventData:" + JSON.stringify(eventToSave) + "}",
        url: "CalendarService.asmx/updateEvent",
        dataType: "json",
        success: function () {
            $('#calendar').fullCalendar('refetchEvents');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            debugger;
        }
    });
}

function intButtons() {
    $('.btn').button();
}

function intDroppables() {
    $('#external-events .fc-event').each(function () {
        $(this).data('event', {
            topic: $(this).text(),
            title: $(this).text(),
            stick: false
        });
        $(this).draggable({
            zIndex: 999,
            revert: "invalid",
            help: "clone",
            revertDuration: 0
        });
    });
}
function intExternalEvents() {
    var clonedEvent = $('#external-events .fc-event').clone();
    var eventDescription = $('#txtExternalEventDescription').val();
    var eventTitle = $('#txtExternalEventTitle').val();
    $(clonedEvent).attr('data-description', eventDescription);
    $(clonedEvent).attr('data-title', eventTitle);
}
function deleteEvent(event) {
    eventToDelete = new Object();
    eventToDelete.eventID = event.id;
    $.ajax({
        type: "POST",
        contentType: "application/json",
        data: "{eventData:" + JSON.stringify(eventToDelete) + "}",
        url: "CalendarService.asmx/deleteEvent",
        dataType: "json",
        success: function () {
            $('#calendar').fullCalendar('removeEvents', event.id);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            debugger;
        }
    });
}

function eventDropped(date, externalEvent) {
    var event_object;
    var copiedEventObject;
    var duration = 60;
    var endDate = date.clone().add(1, 'h');
    //endDate = date.add(1, 'hours');
    event_object = $(externalEvent).data('event');
    event_object.description = $('#txtExternalEventDescription').val();
    event_object.title = $('#txtExternalEventTitle').val();
    copiedEventObject = $.extend({}, event_object);
    copiedEventObject.start = date;
    copiedEventObject.end = endDate;
    copiedEventObject.allDay = false;
    copiedEventObject.placeID = place.place_id;
    copiedEventObject.title = event_object.title;
    copiedEventObject.description = event_object.description;
    updateEvent(copiedEventObject);
    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
    $('#calendar').fullCalendar('rerenderEvents');
    place = "";
}

function showEventClickedPopUp(event) {
    $("#eventForm").dialog({
        autoOpen: false,
        height: 400,
        width: 550,
        modal: true,
        buttons: {
            "Update Event": function () {
                var copiedEvent = new Object();
                copiedEvent.id = event.id;
                copiedEvent.title = $("#eventForm #txtEventTitle").val();
                copiedEvent.start = moment(new Date($("#eventForm #txtEventStartDate").val()));
                copiedEvent.end = moment(new Date($("#eventForm #txtEventEndDate").val()));
                copiedEvent.description = $("#eventForm #txtEventDescription").val();
                updateEvent(copiedEvent);
                $('#calendar').fullCalendar('removeEvents', event.id);
                $('#calendar').fullCalendar('refetchEvents');
                $('#calendar').fullCalendar('renderEvent', copiedEvent, true);
                clearTextBoxes();
            }
        }
    });

    $("#eventForm #txtEventTitle").val();
    $("#eventForm").find("#btnAddEvent").click(function (e) {
        e.preventDefault();
        updateEvent(event);
    });
    $("#eventForm #txtEventDescription").val(event.description);
    $("#eventForm #txtEventTitle").val(event.title);
    $("#eventForm #txtEventStartDate").val(event.start.format('YYYY-MM-DD h:mm:ss'));
    $("#eventForm #txtEventEndDate").val(event.end.format('YYYY-MM-DD h:mm:ss'));
    $("#eventForm").dialog('open');
}

function showDroppedEventPopUp(event) { // currently not used 3/30
    $("#eventForm").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
    });
    $("#txtEventTitle").val(event.title);
    $("txtEventStartDate").val(event.start);
    $("txtEventEndDate").val(event.end);
    $("eventForm").dialog('open');
}
function showPopUp(start, end) {
    $("#eventForm").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
            "Add Event": function () {
                addEventFromDialog();
                clearTextBoxes();
            }
        }
    });

    $("#eventForm #txtEventTitle").val();
    $("#eventForm").find("#btnAddEvent").click(function () {
        addEventFromDialog();
    });
    $("#eventForm #txtEventStartDate").val(start.format('MM-DD-YYYY h:mm'));
    $("#eventForm #txtEventEndDate").val(start.add(1, 'h').format('MM-DD-YYYY h:mm'));
    $("#eventForm").dialog('open');
    $('#ddlEventTopic').selectmenu();
}
function clearTextBoxes() {
    $("#eventForm #txtEventDescription").val("");
    $("#eventForm #txtEventTitle").val("");
    $("#eventForm #txtEventStartDate").val("");
    $("#eventForm #txtEventEndDate").val("");
    $("#eventForm").dialog('close');
}
function getNewID() {
    $.get("CalendarService.asmx/getMaxEventID", function (data) {
        maxEventID = data;
    });
    return maxEventID;
}

function addEventFromDialog() {
    var eventToSave = new Object();
    var event = new Object();
    var topic;
    var e = document.getElementById("ddlEventTopic");
    topic = e.options[e.selectedIndex].value;
    eventToSave.eventTitle = event.title = $('#txtEventTitle').val();
    eventToSave.eventStartDate = event.start = moment(new Date($("#eventForm #txtEventStartDate").val()));
    eventToSave.eventEndDate = event.end = moment(new Date($("#eventForm #txtEventEndDate").val()));
    eventToSave.eventDescription = event.description = $('#txtEventDescription').val();
    eventToSave.eventTopic = event.topic = topic;
    $('#calendar').fullCalendar('refetchEvents');
    $('#calendar').fullCalendar('renderEvent', event, true);

    $.ajax({
        type: "POST",
        contentType: "application/json",
        data: "{eventData:" + JSON.stringify(eventToSave) + "}",
        url: "CalendarService.asmx/updateEvent",
        dataType: "json",
        success: function () {
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            debugger;
        }
    });
}
function setEventColor(topic) {
}
function updateEventSource(data) { // delete?
    var events = new Array();
    $.map(data.d, function (item, i) {
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
        events.push(event);
        console.log(event);
    });
    $('#calendar').fullCalendar('addEventSource', events);
    $('#eventForm').dialog('close');
}

function initAutoComplete() {
    autoComplete = new google.maps.places.Autocomplete((document.getElementById('txtLocation')), { types: ['geocode'] });
    autoComplete.addListener('place_changed', savePlaceID);
}

function savePlaceID() {
    place = autoComplete.getPlace();
}

function geoLocate() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var geoLocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
                center: geoLocation,
                radius: position.coords.accuracy
            });
            autoComplete.setBounds(circle.getBounds());
        });
    }
}

function onSuccess(response) {
    return response.d;
}

function onError(response) {
    console.log(Error);
}