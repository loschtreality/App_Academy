import React from 'react'
import Header from './header'

class Tabs extends React.Component {
  constructor(panes) {
    super(panes)
    this.state = {index: 0}
    this.changeTabs = this.changeTabs.bind(this)
  }

  changeTabs(index){
    this.setState({index})
  }

  render () {
    return (
      <div className="tabApp">
        <ul className="tabs">
          {
            this.props.panes.map((pane, idx) => {
              return <li onClick={this.changeTabs.bind(this, idx)} key={idx}> {pane.title}</li>
              })
          }
        </ul>
        <Header panes={this.props.panes[this.state.index]}/>
      </div>
    )
  }

}


export default Tabs;
