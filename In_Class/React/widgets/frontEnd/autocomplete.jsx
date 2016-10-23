import React from 'react'

class AutoComplete extends React.Component{
  constructor(names) {
    super(names)
    this.state = { search: ""}

    this.findName = this.findName.bind(this)
    this.fillSearch = this.fillSearch.bind(this)
  }

  findName(e) {
    this.setState({search: e.target.value})
  }

  fillSearch(e) {
    this.setState({search: e.target.innerHTML})
  }

  render () {
    let searchText = this.state.search
    let query = new RegExp(searchText, 'i')
    let content;

    if (searchText === "") {
      content = this.props.names.map((name, idx) => <li onClick={ this.fillSearch } key={idx}>{name}</li> )
    } else {
      content = this.props.names.filter((candidate) => query.test(candidate)).map((name, idx) => <li key={idx}>{name}</li> )
    }

    return (
      <section className="autocomp">
        <h4>Auto Complete</h4>
        <label>
          Search:
          <input type="text" onChange={ this.findName } value={searchText}></input>
        </label>
        <ul className="results">
          {content}
        </ul>
      </section>
    )
  }


}

export default AutoComplete
