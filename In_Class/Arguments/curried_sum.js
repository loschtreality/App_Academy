function sumTwo(arg1,arg2) {
  return arg1 + arg2
}

function curriedSum(numArgs) {
  const numbers = [];
  return function _curriedSum(num) {
      numbers.push(num)
      if (numArgs === numbers.length) {
        return numbers.reduce( (a,b)=> a + b)
      } else {
        return _curriedSum
      }
  }

}

Function.prototype.curry = function (numArgs) {
  const collection = [];
  const that = this
  return function _curry(el) {
    collection.push(el)
    if (numArgs === collection.length) {
      return that.apply(that,collection)
    } else {
      return _curry
    }
  }
};

console.log(sumTwo.curry(2)(1)(2));
