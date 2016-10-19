console.log("Hello from the JavaScript console!");

// Your AJAX request here

  $.ajax(
    {
      url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
      type: "GET",
      success(data) {
        console.log(data);
      }
    }
  )

// Add another console log here, outside your AJAX request

console.log("script finishes");


// Make sure you can answer the following questions:

// When does the request get sent?
  // Asynchronously while the synchronous requests run

// When does the response come back?
  // When the server responds with a status code of 200 and the get request is fulfilled

// What's the current weather in New York?
  // NOTE: These are in Kelvin
  // temp: 295.278
  // temp_max:295.278
  // temp_min: 295.278

// Did the page refresh?
  // No

// How could we use different HTTP methods in our request?
  // We could change the type key to POST, PATCH, PUT ..etc. We can also add a data object to send or receive content in a ceratain format
