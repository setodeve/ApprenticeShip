const tagInput = document.getElementById('tag-input')
const tagList = document.getElementById('tag-list')
tagInput.addEventListener("keypress", (e) => AddTag(e));
tagInput.removeEventListener("keypress", (e) => AddTag(e));

function AddTag(e){
  if (e.key === "Enter") {
    e.preventDefault();
    const info = e.target.value.split(',')
    tagInput.value = ""
    tagList.innerHTML += `
      <span class="tag-default tag-pill"> 
        <i class="ion-close-round"></i> 
        ${info[1]}
        <input name="article[tag_ids][]" value=${info[0]} autocomplete="off" type="hidden" id="tag_ids">
      </span>
    `
  }
}