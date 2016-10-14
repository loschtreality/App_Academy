const readline = require('readline');

const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, callback) {
  reader.question("Enter a number: ", function (num) {
    sum += parseInt(num)
    console.log(sum);
    numsLeft -= 1

    if (numsLeft === 0) {
      callback(sum)
    }
    else {
      addNumbers(sum,numsLeft,callback)
    }
  });
}

addNumbers(0,3, function (sum) {
  console.log(sum, "result");
  reader.close();
});
