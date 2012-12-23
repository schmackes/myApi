// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function getLocation(){

    if (navigator.geolocation)
    {
	navigator.geolocation.getCurrentPosition(showPosition);
    }
    else{
	//alert("Geoloaction not supported by this browser.");
	$('.getLocationReceiver').val="Geolocation is not supported by this browser.";
    }
}
function showPosition(position)
{
    //alert(position.coords.latitude +"," + position.coords.longitude)
    $('.getLocationReceiver').val(position.coords.latitude +"," + position.coords.longitude)
    
}
