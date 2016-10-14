const readline = require('readline');

const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});


function askIfGreaterThan(el1,el2,callback) {
  reader.question(`Which number is greater? Is ${el1} greater than ${el2}?: `, function (res) {
    if (res === 'yes') {
      callback(true)
    }
    else {
      callback(false)
    }
  })
}

function innerBubbleSortLoop(arr, i, makeAnySwaps, outerBubbleSortLoop) {

  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], function(res) {
      if(res) {
        let temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        makeAnySwaps = true
      }

      innerBubbleSortLoop(arr, i + 1, makeAnySwaps, outerBubbleSortLoop)
    })
  }
  else {
    outerBubbleSortLoop(makeAnySwaps)
  }
}

function absurdBubbleSort(arr, sortCompletionCallback){
  function outerBubbleSortLoop(makeAnySwaps) {
    if (makeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    }
    else {
      sortCompletionCallback(arr)
    }

  }
  outerBubbleSortLoop(true)
}


absurdBubbleSort([5,4, 3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
