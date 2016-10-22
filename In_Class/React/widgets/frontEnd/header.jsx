import React from 'react'


const Header = ({panes}) => {
  console.log(panes);
  return (
    <div>
      <article>{panes.content}</article>
    </div>
  )
}

export default Header
