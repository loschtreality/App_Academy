let s = new Cat("sparky", "loren")
let c = new Cat("cuddles", "deep")

function Cat(name, owner) {
  this.name = name,
  this.owner = owner
}

Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}`
}
console.log(c.meow());

Cat.prototype.meow = function () {
  return "meow"
}

c.meow = function () {
  return "bark"
}

Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}`
}

// console.log(c.cuteStatement());
// console.log(s.meow());
// console.log(c.cuteStatement());
// console.log(s.meow());
