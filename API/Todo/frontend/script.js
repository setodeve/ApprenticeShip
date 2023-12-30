class Todo {
  constructor(){
    this.todoList = document.getElementById('todo-list')
    this.newTodo = document.getElementById('new-todo')
    this.path = 'http://localhost:3000/'
  }

  fetchTodos(){
    this.todoList.innerHTML = ""
    fetch(this.path+'todos')
    .then(response => response.json())
    .then(data => {
      data.data.forEach((todo) => {
        let liTodo = document.createElement('li')
        liTodo.classList.add("todo-item")
        liTodo.innerHTML = `
          ${todo.title}
          <span><button onclick="todo.editTodo(${todo.id})">Edit</button></span>
          <span><button onclick="todo.deleteTodo(${todo.id})">Delete</button></span>
        `
        this.todoList.appendChild(liTodo)
      });
    })
  }

  addTodo(){
    fetch(this.path + 'todos', {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        "todo": {
          "title": this.newTodo.value
        }
      })
    })
    .then(()=>{
      this.newTodo.value = ""
      this.fetchTodos()
    })
  }

  editTodo(id){
    let todo = window.prompt("変更後のTodoを入力してください", "");
    if (todo == "") return
    fetch(this.path + 'todos/' + id, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        "todo": {
          "title": todo
        }
      })
    })
    .then(()=>{
      this.newTodo.value = ""
      this.fetchTodos()
    })
  }

  deleteTodo(id){
    fetch(this.path + 'todos/' + id, {
      method: "DELETE"
    })
    .then(()=>{
      this.fetchTodos()
    })
  }
}

const todo = new Todo();
todo.fetchTodos()