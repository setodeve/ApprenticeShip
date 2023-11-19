function checkDivisibleByFive(num) {
  if(num%2==0){
    console.log("割り切れます")
  }else{
    throw new Error("something wrong");
  }
}

// 処理を記述、try...catch 構文を使用し、その中で checkDivisibleByFive 関数を呼び出す
try {
  checkDivisibleByFive(5)
} catch (e) {
  // something wrong
  console.log(e.message);
}