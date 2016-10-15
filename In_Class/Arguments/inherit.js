

Object.prototype.inherits = function (superClass) {
  function Surrogate() {}
  Surrogate.prototype = superClass.prototype
  this.prototype = new Surrogate()
  this.prototype.constructor = this
};


function MovingObject () {};

  MovingObject.prototype.test = function () {
    console.log("I'm working.");
  }

function Ship () {};
Ship.inherits(MovingObject);

function Asteroid () {};
Asteroid.inherits(MovingObject);

let a = new Asteroid()
let s = new Ship()
a.test()
s.test()
