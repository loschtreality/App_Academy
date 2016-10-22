import React from 'react'

class Weather extends React.Component {
  constructor() {
    super()
    this.state = {response: ""}

  }
  componentDidMount(){
    let currentLoc = navigator.geolocation
    let request = new XMLHttpRequest();
      request.open('GET', `http://api.openweathermap.org/data/2.5/forecast/city?id=${currentLoc.getCurrentPosition()}&APPID=547c1d8dae27d716c0592f1808555334`, true);
      request.onload = function() {
        if (request.status >= 200 && request.status < 400) {
          // Success!
          console.log('SUCCESS');
          let resp = request.responseText;
          let node = document.getElementByClass("api")
          node.innerHTML = resp;
        } else {
          console.log(currentLoc);
          console.log("you done fucked up");
          // We reached our target server, but it returned an error

        }
      };

    request.send();

  }

  render () {
    return (
      <div>
        <p className="api"></p>


      </div>
    )
  }

}


export default Weather;

//
