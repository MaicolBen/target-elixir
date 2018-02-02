const mapElement = document.getElementsByClassName('map')[0];
const initMap = function(google){
  const handleLocationError = function(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    const errorMessage = browserHasGeolocation ?
                            'Error: The Geolocation service failed.' :
                            'Error: Your browser doesn\'t support geolocation.'
    infoWindow.setContent(errorMessage);
    infoWindow.open(map);
  }
  let infoWindow = new google.maps.InfoWindow;
  let map = new google.maps.Map(mapElement, {
    zoom: 4,
  });
  // HTML5 geolocation.
  if (window.navigator.geolocation) {
    window.navigator.geolocation.getCurrentPosition(function(position) {
      const pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.setCenter(pos);
      map.setZoom(16);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}
if (mapElement){
  const GoogleMapsLoader = require('google-maps');
  GoogleMapsLoader.KEY = mapElement.dataset['apiKey'];

  GoogleMapsLoader.load(initMap);
}
