Array.prototype.uniq = function () {
  let result = [];

  for (let i = 0; i < this.length; i++) {
    if (!result.includes(this[i])){
      result.push(this[i]);
    }
  }
  return result
}

// console.log([1, 2, 1, 3, 3].uniq());

Array.prototype.twoSum = function(){

  let result = [];

  for (var i = 0; i < this.length; i++) {
    for (var j = i+1; j < this.length; j++) {
      if (this[i]+this[j] === 0) {
        result.push([i,j]);
      }
    }
  }
  return result;
}

// console.log([-1, 0, 2, -2, 1].twoSum());


Array.prototype.myTranspose = function () {
  let result = []

  for (let i = 0; i < this.length; i++) {
    let arr = []
    for (let j = 0; j < this.length; j++) {
      arr.push(this[j][i])
    }
    result.push(arr)
  }

  return result
}


// console.log([
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8]
//   ].myTranspose());


function myEach(array,callback) {
  for (var i = 0; i < array.length; i++) {
    callback(array[i], i, array)
  }
}


function myMap(array,callback) {
  let result = []

  for (var i = 0; i < array.length; i++) {
    result.push(callback(array[i], i, array))
  }

  return result
}

function myReduce(array, callback, init) {
  for (var i = 0; i < array.length; i++) {
    if (!init) {
      init = array[i]
    }
    else {
      init = callback(init, array[i])
    }
  }
  return init
}


function myFilter(array, callback) {
  let result = []

  for (var i = 0; i < array.length; i++) {
    if (callback(array[i])){
      result.push(array[i]);
    }
  }
  return result;
}

function myCount(array) {
  let count = 0;

  if (Array.isArray(array)){
    count = array.length;
  }
  else{
    count = Object.keys(array).length
  }
  return count
}

// nums = [1, 4, 5, 6, 7];
// elements = {first:"hydrogen", second:'helium', third:'lithium'};
//
// console.log(myCount(nums));
// console.log(myCount(elements));


function myIncludes(array, val) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] === val){
      return true;
    }
  }
  return false;
}

function mySome(array,callback) {
  for (var i = 0; i < array.length; i++) {
    if (callback(array[i])){
      return true;
    }
  }
  return false;
}

Array.prototype.myEach = function (callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i], i, this)
  }
}


function median(array) {
  array.sort(function(a,b) { return a > b})
  let mid = array.length / 2
  if (array.length % 2 === 0) {
    return (array[mid] + array[mid - 1]) / 2
  }
  else {
    return array[Math.floor(mid)]
  }
}


// let x = [7,4,6,9,10,11]
//
// console.log(median(x));


function concatenate(array) {
  return array.reduce(function (a,b) {
    return a + b
  })
}

// console.log(concatenate(["Yay ", "for ", "strings!"]));


function bubbleSort(array) {
  let notSorted = false;

  do{
    notSorted = false
    for (var i = 0; i < array.length - 1; i++) {
      for (var j = i+1; j < array.length; j++) {
        if (array[i] > array[j]) {
          let temp = array[j]
          array[j] = array[i]
          array[i] = temp
          notSorted = true
        }
      }
    }
  }while(notSorted === false)

  return array
}


// console.log(bubbleSort([9,7,6,4,2]));


function subStrings(string){
  let array = [string]

  for (var i = 0; i < string.length; i++) {
    for (var j = i; j < string.length; j++) {
      if (i === 0 && j === 0) {
        continue;
      }
      array.push(string.substr(i,j))
    }
  }
  return array
}

// console.log(subStrings('cat'))


function range(start,end) {
  if (start > end) {
    return [];
  }
  return range(start ,end - 1).concat(end)
}

// console.log(range(0,10));


function expOne(b, n) {
  if (n === 0) {
    return 1
  }
  return b * expOne(b, n - 1)
}

function expTwo(b, n) {
  if (n === 0) {
    return 1
  }
  else if (n % 2 === 0) {
    return expTwo(b, n / 2)  * expTwo(b, n / 2)
  }
  else {
    return b * (expTwo(b, (n - 1) / 2) * expTwo(b, (n - 1) / 2))
  }
}


// console.log(expTwo(3,3), "second");


function fib(n){
  if ( n === 2 ){
    return [0 ,1];
  }
  let arr = fib(n - 1)
  return arr.concat(arr[arr.length - 1] + arr[arr.length - 2])
}

// console.log(fib(10));

function bsearch(array,target) {

  let mid = Math.floor(array.length / 2)
  let midElement = array[mid]

  if (array.length === 1 ) {
    if (midElement === target){
      return mid;
    }else{
      return null;
    }
  }

  if (midElement === target) {
    return mid
  } else if (midElement > target) {
    // console.log(mid, 'mid');
    let partArray = array.slice(0,mid)
    // console.log(partArray, 'left');
    return bsearch(partArray, target)
  } else if (midElement < target){
    // console.log(mid, 'mid right');
    let partArray = array.slice(mid, array.length)
    // console.log(partArray, 'right');
    return bsearch(partArray, target) + mid
  }
}

//
// console.log(bsearch([1, 2, 3], 1)); // => 0
// console.log(bsearch([2, 3, 4, 5], 3)); // => 1
// console.log(bsearch([2, 4, 6, 8, 10], 6)); // => 2
// console.log(bsearch([1, 3, 4, 5, 9], 5)); // => 3
// console.log(bsearch([1, 2, 3, 4, 5, 6], 6)); // => 5
// console.log(bsearch([1, 2, 3, 4, 5, 6], 0)); // => nil
// console.log(bsearch([1, 3, 4, 5, 7], 2)); // => nil
