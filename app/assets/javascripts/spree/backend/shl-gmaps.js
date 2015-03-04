$(document).ready(function () {
    var defaultLat = $('#map_lat').val() == '' ? 24.8614622 : $('#map_lat').val();
    var defaultLng = $('#map_lng').val() == '' ? 67.00993879999999 : $('#map_lng').val();


    var defaultPosition = new google.maps.LatLng(defaultLat, defaultLng);
    var mapOptions = {center: defaultPosition, zoom: 12};
    var geocoding = new google.maps.Geocoder();

    var current_map_canvas_id = $('.map-canvas').prop("id");
    var mp = new google.maps.Map(document.getElementById(current_map_canvas_id), mapOptions);
    mp["marker"] = [];

    updateLatLngForTextFieldsFor(mp, defaultLat, defaultLng, false);

    google.maps.event.addListener(mp, 'click', function (e) {

        updateLatLngForTextFieldsFor(mp, e.latLng.lat(), e.latLng.lng(), true);
    });


    $('#city, #street1, #state-field').on('blur', function (event) {
        updateMap(geocoding, mp);

    });


    $('#country-dropdown').on('change blur', function (event) {

        updateMap(geocoding, mp);

    });


});

function updateMap(geocoding,mp){
    var street1 = $('#street1').val();
    var street2 = $('#street2').val();
    var state = $('#state-field').val();
    var city = $('#city').val();
    var country = $('#select2-chosen-1').text();

    var address = street1 + " " + street2 + " " + state + " " + city + " " + country

    codeAddress(geocoding, address, mp);


}

function updateLatLngForTextFieldsFor(map, lat, lng, forceUpdate) {
    var currentLat = $('#map_lat').val();
    var currentLng = $('#map_lng').val();

    if ((currentLng == "" && currentLat == "") || forceUpdate) {
        $('#map_lat').val(lat);
        $('#map_lng').val(lng);
    }


    var marker = map["marker"];


    if (!(marker instanceof google.maps.Marker)) {
        if ((currentLng == "" && currentLat == "") || forceUpdate)
            placeNewMarker(new google.maps.LatLng(lat, lng), map);
        else
            placeNewMarker(new google.maps.LatLng(currentLat, currentLng), map);
    }
    else {
        marker.setPosition(new google.maps.LatLng(lat, lng));
    }

}


function placeNewMarker(position, map) {
    var marker = new google.maps.Marker({
        position: position,
        map: map
    });

    map["marker"] = marker;
//    map.setCenter(position)

}


// GEOCODING FUNCTIONS

function codeAddress(geocoding, address, map) {


    if (address.length > 0) {

        geocoding.geocode({'address': address}, function (results, status) {

            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);


                $('#map_lng').val(results[0].geometry.location.lng())
                $('#map_lat').val(results[0].geometry.location.lat())

                var marker = map["marker"];
                marker.setPosition(results[0].geometry.location);
            } else {
                console.log("Geocode was not successful for the following reason: " + status);
            }
        });
    } else {
        console.log("Search field can't be blank");
    }
}

$(document).ready(function () {
    $('#map-button').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
//        codeAddress(geocoding);
    });


});

