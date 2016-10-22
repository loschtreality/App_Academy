import React from 'react'


class Clock extends React.Component {
  constructor() {
    super()
    this.state = {clock: new Date()}

  }

  componentDidMount() {
    setInterval(()=>{
      this.setState({clock: new Date()})
    }, 1000)
  }

  componentWillUnmount(){

  }


  render () {
    return (
      <div className="clock">
        <div className="clock-container">
          <span>Date:</span>
          <span>Time:</span>
        </div>
        <div className="clock-container">
          <p className="date">{this.state.clock.toDateString()}</p>
          <p className="time">{this.state.clock.getHours()}: {this.state.clock.getMinutes()}: {this.state.clock.getSeconds() < 10 ? `0${this.state.clock.getSeconds()}` : this.state.clock.getSeconds()}</p>
        </div>
      </div>
    )
  }

}


export default Clock;
