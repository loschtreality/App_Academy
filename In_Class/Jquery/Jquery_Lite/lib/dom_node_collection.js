class DomNodeCollection {
  constructor(HTMLelements) {
    this.HTMLelements = HTMLelements;
  }

  html(string) {
    if (string === undefined) {
      return this.HTMLelements[0].innerHTML;
    }

    this.HTMLelements.forEach(function (element,i,array) {
      element.innerHTML = string;
    });

    return this.HTMLelements;
  }

  empty() {
    this.HTMLelements.forEach(function (element,i,array) {
      element.innerHTML = "";
    });
    return this.HTMLelements;
  }

  append(arg) {

    if (!arg instanceof DomNodeCollection ) { arg = $l(arg) }

    if (typeof arg === "string") {
       this.HTMLelements.forEach(el => el.innerHTML += arg);
    } else if (arg instanceof DomNodeCollection) {
      this.HTMLelements.forEach(el => {
        arg.HTMLelements.forEach( element => {
          let n = element.cloneNode(true)
          el.appendChild(n)
        })
      })
    }
  }

  attr(attribute, value) {
    if (value) {
      this.setAttribute(attribute, value);
    } else {
      this.getAttribute(attribute);
    }
  }

  addClass(className) {
    if (this.classList) {
      this.classList.add(className);
    }
    else {
      this.className += ' ' + className;
    }
  }

  removeClass(className) {
    if (this.classList) {
      this.classList.remove(className);
    }
  }

  children() {


  }

}


module.exports = DomNodeCollection;
