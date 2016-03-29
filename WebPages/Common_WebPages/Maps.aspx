<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maps.aspx.cs" Inherits="Maps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <script type="text/javascript">
        google.load('visualization', '1', { packages: ['corechart'] });
        google.load('search', '1');
        // chart wrappers
        var chartWrapper1;
        var chartWrapper2;
        var chartWrapper3;
        var chartWrapper4;
        var chartWrapper5;

        // data tables (contain results of queries)
        var dataTable1;
        var dataTable2;
        var dataTable3;
        var dataTable4;
        var dataTable5;

        var map1;

        var queryString;

        function map() {
     // this gets called when the query results are returned from Google spreadsheet


     // create a map
     map1 = new google.maps.Map(document.getElementById('container2'), {
         mapTypeId: google.maps.MapTypeId.ROADMAP,
         zoom: 5
     });
     // create a LatLng object (latitude and longitude values)
     var latlng = new google.maps.LatLng(38.5, -78.9);
     // center the map at the lat/lng location
     map1.setCenter(latlng);

            // geocode and mark addresses from data table
            /*
     var geocoder = new google.maps.Geocoder();
     for (var i = 0; i < dataTable1.getNumberOfRows(); i++) {
         var address = dataTable1.getValue(i, 0);
         geocoder.geocode({ 'address': address }, onGeocodeResponse);
     }*/

 }
        /*function onGeocodeResponse(response, status) {
            // the Geocode service has sent its response. We can now use it for the map
            if (status == google.maps.GeocoderStatus.OK) {
                // display a marker with a tooltip
                var marker = new google.maps.Marker({
                    map: map1,
                    position: response[0].geometry.location,
                    title: response[0].address_components[0].long_name
                });

            }
        }*/

    </script>
   
      
   
</body>
</html>
