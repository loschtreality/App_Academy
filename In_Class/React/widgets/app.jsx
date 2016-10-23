import React from 'react'
import ReactDOM from 'react-dom'
import Tabs from './frontEnd/tabs'
import Clock from './frontEnd/clock'
import Weather from './frontEnd/weather'
import AutoComplete from './frontEnd/autocomplete'

const panes = [
  {
    title: "One",
    content: "pane to rule them all"
  },
  {
    title: "Two",
    content: "Is better than one"
  },
  {
    title: "Three",
    content: "Try tangoing with this"
  }
];


const names = [
  "Michael",
  "Loren",
  "Amy",
  "Nicole",
  "Brandon",
  "John",
  "Laura",
  "Beth",
  "Steven",
  "Johnathan"
]

document.addEventListener("DOMContentLoaded", () => {
  let root = document.getElementById('root')
  let clock = document.getElementById('clock')
  let weather = document.getElementById('weather')
  let autocomp = document.getElementById('auto-complete')
  ReactDOM.render(<Tabs panes={panes} />,root)
  ReactDOM.render(<Clock/>,clock)
  ReactDOM.render(<Weather/>, weather)
  ReactDOM.render(<AutoComplete names={names}/>, autocomp)
})
