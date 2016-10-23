import React from 'react'

class Weather extends React.Component {
    constructor() {
        super()
        this.state = {
            response: ""
        };
        this.apiRequest = this.apiRequest.bind(this);
    }

    componentDidMount() {
        navigator.geolocation.getCurrentPosition(this.apiRequest);
    }

    apiRequest(location) {
        let latitude = location.coords.latitude;
        let longitude = location.coords.longitude;

        let request = new XMLHttpRequest();

        request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&APPID=547c1d8dae27d716c0592f1808555334&units=imperial`, true);
        request.onreadystatechange = () => {
            if (request.status >= 200 && request.status < 400 && request.readyState === XMLHttpRequest.DONE) {
                // Success!
                let resp = JSON.parse(request.responseText);
                this.setState({response: resp});
            }
        };

        request.send();

    }

    render() {
        let temperature = this.state.response
        let display;

        if (temperature) {
            display = (
                <div className="api">
                  <span>{temperature.name}</span>
                  <span>{`${temperature.main.temp} Farenheight`}</span>
                </div>
            )
        } else {
            display = (
                <div className="api">Loading weather....</div>
            )
        }
        return (
            <div className="weather">
                {display}
            </div>
        )
    }

}

export default Weather;
