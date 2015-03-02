$(document).ready(function () {
    var defaultLat = 24.8614622;
    var defaultLng = 67.00993879999999;
    var defaultPosition = new google.maps.LatLng(defaultLat, defaultLng);
    var mapOptions = {center: defaultPosition, zoom: 12};

    $('.map-canvas').each(function () {
        var current_map_canvas_id = $(this).prop("id");
        var mp = new google.maps.Map(document.getElementById(current_map_canvas_id), mapOptions);
        mp["marker"] = [];

        updateLatLngForTextFieldsFor(mp, defaultLat, defaultLng, false);

        google.maps.event.addListener(mp, 'click', function (e) {

            updateLatLngForTextFieldsFor(mp, e.latLng.lat(), e.latLng.lng(), true);
        });

    })


});

function updateLatLngForTextFieldsFor(map, lat, lng, forceUpdate) {
    var currentLat = $(map.getDiv()).closest('li').find('#map_lat').val();
    var currentLng = $(map.getDiv()).closest('li').find('#map_lng').val();

    if ((currentLng == "" && currentLat == "") || forceUpdate) {
        $(map.getDiv()).closest('li').find('#map_lat').val(lat);
        $(map.getDiv()).closest('li').find('#map_lng').val(lng);
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

function codeAddress(geocoding) {

    var address = $("#business_address").val();
    if (address.length > 0) {

        geocoding.geocode({'address': address}, function (results, status) {

            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);


                $('#map_lng').val(results[0].geometry.location.lng())
                $('#map_lat').val(results[0].geometry.location.lat())

                marker.setPosition(results[0].geometry.location);
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    } else {
        alert("Search field can't be blank");
    }
}

var geocoding = new google.maps.Geocoder();

$(document).ready(function () {
    $('#map-button').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
        codeAddress(geocoding);
    });
});

