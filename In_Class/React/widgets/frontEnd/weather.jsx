import React from 'react'

class Weather extends React.Component {
  constructor() {
    super()
    this.state = {response: ""}

  }
  componentDidMount(){
    let request = new XMLHttpRequest();

    navigator.geolocation.getCurrentPosition(function success(pos) {
    this.apiRequest(pos.coords)

    }, function error(err) {
      console.log(err, "error in geolocation");
    })
  }


  apiRequest(currentLoc) {
    request.open('GET', `http://api.openweathermap.org/data/2.5/forecast/city?id=${currentLoc}&APPID=547c1d8dae27d716c0592f1808555334`, true);
    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        // Success!
        console.log('SUCCESS');
        let resp = request.responseText;
        let node = document.getElementByClass("api")
        node.innerHTML = resp;
      } else {
        // We reached our target server, but it returned an error
        console.log("recheck function");
      }
    };

  request.send();

  }

  render () {
    return (
      <div className="weather">
        <p className="api"></p>
      </div>
    )
  }

}


export default Weather;
