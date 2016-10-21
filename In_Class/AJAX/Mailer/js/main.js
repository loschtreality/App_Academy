document.addEventListener("DOMContentLoaded",  () => {
  let navs = Array.from(document.querySelectorAll("sidebar-nav li"))

  navs.forEach((item) => {
    item.addEventListener("click",() => {
      location.hash = item.innerText.toLowerCase()
    })
  })

})
