<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Travel Modes in Directions</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 425px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
  </head>
  <body>
    <div id="floating-panel">
    <b>Mode of Travel: </b>
    <select id="mode">
      <option value="DRIVING">Driving</option>
      <option value="WALKING">Walking</option>
      <option value="BICYCLING">Bicycling</option>
      <option value="TRANSIT">Transit</option>
    </select>
    </div>
    <div id="map"></div>
    <script>
    function initMap() {
    	  var directionsService = new google.maps.DirectionsService();
    	  var directionsDisplay = new google.maps.DirectionsRenderer();
    	  var chicago = new google.maps.LatLng(41.850033, -87.6500523);
    	  var mapOptions = {
    	    zoom:7,
    	    center: chicago
    	  }
    	  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    	  directionsDisplay.setMap(map);
    	}

    	function calcRoute() {
    	  var start = {lat: 23.751120, lng: 90.386908};
    	  var end = {lat: 23.751280, lng: 90.378395};
    	  var request = {
    	    origin: start,
    	    destination: end,
    	    travelMode: 'DRIVING'
    	  };
    	  directionsService.route(request, function(result, status) {
    	    if (status == 'OK') {
    	      directionsDisplay.setDirections(result);
    	    }
    	    else {
                window.alert('Directions request failed due to ' + status);
              }
    	  });
    	}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDF-Hexb9uIJ0FSurqMJkBmnya7G_dgUTk&callback=initMap">
    </script>
  </body>
</html>