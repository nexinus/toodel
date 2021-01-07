function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var toiletAddress = document.getElementById('toilet_address');

    if (toiletAddress) {
      var autocomplete = new google.maps.places.Autocomplete(toiletAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(toiletAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
