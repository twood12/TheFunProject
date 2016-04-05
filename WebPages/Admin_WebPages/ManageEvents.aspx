<%@ Page Title="Manage Events" Language="C#" MasterPageFile="~/NestedMasterPages/WBLAdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageEvents.aspx.cs" Inherits="WebPages_Admin_WebPages_ManageEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%: System.Web.Optimization.Scripts.Render("~/bundles/adminCalendar") %>

    <%: System.Web.Optimization.Styles.Render("~/Content/css") %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrap">
        <div id="external-events-wrapper">
            <div id="external-events">
                <h3>Create Events</h3>
                <div id="MC" class="fc-event MC">MC</div>
                <div id="B-Boy" class="fc-event B-Boy">B-Boy</div>
                <div id="DJ" class="fc-event DJ">DJ</div>
                <div id="Graffiti" class="fc-event Graffiti">Graffiti</div>
                <div id="CommunityService" class="fc-event Community-Service">Community Service</div>
                <div id="General" class="fc-event General">General</div>
            </div>
            <div class="external-event-text">
                <label for="txtExternalEventTitle"><strong>Event Title</strong></label><input type="text" id="txtExternalEventTitle" />
                <label for="txtExternalEventDescription"><strong>Event Description</strong></label><input type="text" id="txtExternalEventDescription" />
                <label for="txtLocation"><strong>Event Location:</strong></label><input type="text" id="txtLocation" onfocus="geoLocate()" />
            </div>
        </div>

        <div id="calendar"></div>
        <div id="trashCan" class="ui-widget-header">
            <p>Delete Event</p>
        </div>
        <div style='clear: both'></div>
    </div>
    <div id="eventForm" title="Add New Event" style="display: none">
        <form runat="server">
            <fieldset>
                <label for="txtEventTitle">Event Title:</label><input type="text" id="txtEventTitle" class="text-center ui-widget-content ui-corner-all" />
                <label for="txtEventStartDate">Event Start Date:</label><input type="text" id="txtEventStartDate" class="text-center ui-widget-content ui-corner-all" />
                <label for="txtEventEndDate">Event End Date:</label><input type="text" id="txtEventEndDate" class="text-center ui-widget-content ui-corner-all" />
                <label for="txtEventDescription">Event Description:</label><input type="text" id="txtEventDescription" class="text-center ui-widget-content ui-corner-all" />
                <label for="txtEventLocation">Event Location:</label><input type="text" id="txtEventLocation" class="text-center ui-widget-content ui-corner-all" />

                <label for="ddlEventTopic">Event Topic:</label>
                <select id="ddlEventTopic" class="ui-selectmenu">
                    <option value="MC">MC</option>
                    <option value="DJ">DJ</option>
                    <option value="B-Boy">B-Boy</option>
                    <option value="Graffiti">Graffiti</option>
                    <option value="Community Service">Community Service</option>
                    <option value="General">General</option>
                </select>

                <input type="submit" id="btnAddEvent" tabindex="-1" style="position: absolute; top: -10000px" />
            </fieldset>
            <asp:ScriptManager ID="scriptManager" runat="server">
                <Scripts>
                    <asp:ScriptReference Path="https://maps.googleapis.com/maps/api/js?key=AIzaSyAK7q44pdNrG5IN3XFw9_rR-b8n_XTI4D4
        &libraries=places&callback=initAutoComplete" />
                </Scripts>
            </asp:ScriptManager>
        </form>
    </div>
</asp:Content>