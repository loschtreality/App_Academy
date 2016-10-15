//
function sum() {
  let args = Array.from(arguments)
  let sum = 0;
  args.forEach(function(el) {
    sum += el
  })
  return sum
}
//
// console.log(sum(5,4))
//
function sum2(...args) {
  let sum = 0;
  args.forEach((el) => {
    sum += el;
  } )
  return sum;
}
//
// console.log(sum2(1,2))


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

Function.prototype.myBind = function () {
  let arr = Array.from(arguments)
  let first = arr[0]
  let that = this
  let rest = [];
  if (arr.length > 1) {
    rest = arr.slice(1)
  }

  return function () {
    let innerArgs = Array.from(arguments)
    let finalArgs = rest.concat(innerArgs)
    console.log(that.apply(first, finalArgs));
    return true
  }

  }

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true
