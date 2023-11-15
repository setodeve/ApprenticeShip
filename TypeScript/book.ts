function printBooks(books:string[]) {
  for (let i = 0; i < books.length; i++){
    console.log(books[i]);
  }
}

let books = ["『JavaScript入門』山田太郎","『JavaScriptの絵本』山田次郎"];
printBooks(books);