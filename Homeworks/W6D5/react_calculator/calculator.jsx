import React from 'react';

class Calculator extends React.Component {
  constructor() {
    super()
    this.state = {X: "", Y: "", total: 0}
    this.updateX = this.updateX.bind(this)
    this.updateY = this.updateY.bind(this)
    this.add = this.add.bind(this)
    this.subtract = this.subtract.bind(this)
    this.multiply = this.multiply.bind(this)
    this.divide = this.divide.bind(this)
    this.divide = this.divide.bind(this)
    this.clearInputs = this.clearInputs.bind(this)
  }


  updateX(e) {
    this.setState({X: e.target.value})
  }

  updateY(e) {
    this.setState({Y: e.target.value})
  }

  clearInputs(e) {
    e.preventDefault()
    this.setState({X: "", Y: "", total: 0})
  }

  add(e) {
    e.preventDefault()
    this.setState({total: parseInt(this.state.X) + parseInt(this.state.Y)})
  }

  subtract(e) {
    e.preventDefault()
    this.setState({total: parseInt(this.state.X) - parseInt(this.state.Y)})
  }

  multiply(e) {
    e.preventDefault()
    this.setState({total: parseInt(this.state.X) * parseInt(this.state.Y)})
  }

  divide(e) {
    e.preventDefault()
    this.setState({total: parseInt(this.state.X) / parseInt(this.state.Y)})
  }

  render () {

    return (
      <div>
        <h1>Calculator</h1>
        <label>X:
          <input id="X" type="text" onChange={ this.updateX } value={this.state.X}></input>
        </label>
        <label>Y:
          <input id="Y" type="text" onChange={ this.updateY } value={this.state.Y}></input>
        </label>
        <span className="total">{this.state.total}</span>

        <hr></hr>
        <button onClick={ this.add }>+</button>
        <button onClick={ this.subtract }>-</button>
        <button onClick={ this.multiply }>*</button>
        <button onClick={ this.divide }>/</button>
        <button onClick={ this.clearInputs }>CLEAR</button>
      </div>
    )
  }
}

export default Calculator
