/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const DNC = __webpack_require__(1);

	Window.prototype.$l = function (selector) {
	  let argument;
	  if (typeof selector === 'string') {
	    argument = Array.from(document.querySelectorAll(selector))
	  } else if (typeof selector === 'object') {
	    argument = [selector]
	  }
	  return new DNC(argument)
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

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


/***/ }
/******/ ]);