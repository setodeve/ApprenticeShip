let cnt = 0;

function addTodo(str: string) {
  cnt += 1;
  const ul_todos = document.getElementById("todo-list");

  const li_todo = document.createElement("li");
  li_todo.classList.add("todo-item");
  li_todo.id = `todo-${String(cnt)}`;

  const input_checkbox = document.createElement("input");
  input_checkbox.id = String(cnt);
  input_checkbox.type = "checkbox";
  li_todo.appendChild(input_checkbox);
  const inputOnClick = (event: MouseEvent) => {
    strikeoutTodo(event.target as HTMLInputElement);
  };
  input_checkbox.onclick = inputOnClick;

  const span_todo = document.createElement("span");
  span_todo.innerHTML = str;
  span_todo.id = `span-${String(cnt)}`;
  li_todo.appendChild(span_todo);

  const delete_button = document.createElement("button");
  delete_button.classList.add("delete-button");
  delete_button.id = String(cnt);
  delete_button.innerHTML = "削除";
  li_todo.appendChild(delete_button);
  const deleteOnClick = (event: MouseEvent) => {
    deleteTodo(event.target as Element);
  };
  delete_button.onclick = deleteOnClick;

  ul_todos!.appendChild(li_todo);
}

function deleteTodo(target: Element ) {
  const todo = document.getElementById(`todo-${target.id}`);
  todo!.remove();
}

function strikeoutTodo(target: HTMLInputElement) {
  const span_todo = document.getElementById(`span-${target!.id}`);
  if (target.checked) {
    span_todo!.style.textDecoration = "line-through";
  } else {
    span_todo!.style.textDecoration = "none";
  }
}

const form_todos = document.querySelector("form");

form_todos!.addEventListener("submit", {
  handleEvent: (event: SubmitEvent) => {
    event.stopPropagation();
    event.preventDefault();
    if (event.target[0].form[0].value == "") {
      return;
    }
    addTodo(event.target[0].form[0].value);
    event.target[0].form[0].value = "";
  },
});
