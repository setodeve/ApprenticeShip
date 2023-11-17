const h1_title: HTMLHeadingElement = <HTMLHeadingElement>(
  document.querySelector("h1")
);
h1_title.innerHTML = "シンプルブログ";

const event_form: HTMLElement = <HTMLElement>(
  document.getElementById("post-form")
);
const div_posts: HTMLElement = <HTMLElement>document.getElementById("posts");

event_form.addEventListener("submit", {
  handleEvent: (event: SubmitEvent) => {
    event.stopPropagation();
    event.preventDefault();

    const h2_posts = document.createElement("h2");
    const p_posts = document.createElement("p");
    const div_post = document.createElement("div");

    h2_posts.textContent = event.target[0].form[0].value;
    p_posts.textContent = event.target[0].form[1].value;

    div_post?.appendChild(h2_posts);
    div_post?.appendChild(p_posts);
    div_posts?.appendChild(div_post);

    event.target[0].form[0].value = "";
    event.target[0].form[1].value = "";

    if (div_posts.childNodes.length == 4) {
      div_posts.firstChild.remove();
    }
  },
});

event_form.addEventListener("mouseover", {
  handleEvent: () => {
    event_form.style.backgroundColor = "yellow";
    return false;
  },
});

event_form.addEventListener("mouseout", {
  handleEvent: () => {
    event_form.style.backgroundColor = "white";
    return false;
  },
});
