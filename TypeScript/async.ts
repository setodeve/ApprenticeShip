function asyncSort(numbers:number[]) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(numbers.sort())
    }, 2000);
  });
}

async function sortNumbers() {
  const numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  // ここにコードを書く
  const sortedNumbers = await asyncSort(numbers)
  // asyncSort 関数を await を使って同期的に呼び出し、結果を sortedNumbers に入れる
  console.log(sortedNumbers); // ソートされた配列をコンソールに出力する
}

sortNumbers();
console.log('同期処理');

// 同期処理
// [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]