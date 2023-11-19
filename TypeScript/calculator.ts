const display = document.getElementById("display");
const result = document.createElement("span");
const digit_button = document.getElementsByClassName("digit");
for (let i = 0; i < digit_button.length; i++) {
  digit_button[i].addEventListener("click", {
    handleEvent: () => {
      result.id = "result"
      result.innerHTML += digit_button[i].innerHTML;
      display?.appendChild(result);
    },
  });
}

const operator_button = document.getElementsByClassName("operator");
for (let i = 0; i < operator_button.length; i++) {
  operator_button[i].addEventListener("click", {
    handleEvent: () => {
      result.innerHTML += operator_button[i].innerHTML;
      display?.appendChild(result);
    },
  });
}

const clear_button = document.getElementById("clear");
clear_button!.addEventListener("click", {
  handleEvent: () => {
    result.innerHTML = "";
  },
});

function calcilate(num: string[], ope: string[]) {
  let tmp = Number(num.shift());
  while (ope.length != 0) {
    switch (ope.shift()) {
      case "+":
        tmp += Number(num.shift());
        break;
      case "-":
        tmp -= Number(num.shift());
        break;
      case "*":
        tmp *= Number(num.shift());
        break;
      case "/":
        tmp /= Number(num.shift());
        break;
      default:
        break;
    }
  }
  const finalresult = document.getElementById("result");
  finalresult!.innerHTML = "";
  finalresult!.innerHTML += tmp;
}

function parseResult() {
  const numbers = result.innerText.split(/[+/*-]/);
  const operators = result.innerText.split(/[0-9]/).filter(Boolean);
  while (operators.length != 0) {
    calcilate(numbers, operators);
  }
}

const equals_button = document.getElementById("equals");
equals_button!.addEventListener("click", {
  handleEvent: () => {
    parseResult();
  },
});
