const tagInput = document.getElementById('tag-input')
const tagList = document.getElementById('tag-list')
const tagEvent = document.getElementsByClassName('tag-event')
tagInput.addEventListener("keypress", (e) => addTag(e));
tagInput.removeEventListener("keypress", (e) => addTag(e));

if (tagEvent != undefined) {
  for(let i = 0; i < tagEvent.length; i++) {addTagEvent(tagEvent[i])}
}


function addTag(e){
  if (e.key === "Enter") {
    e.preventDefault();
    const info = e.target.value.split(',')
    const spanTag = document.createElement('span')
    spanTag.classList.add("tag-default","tag-pill","tag-event")
    addTagEvent(spanTag)
    spanTag.innerHTML = `
      <i class="ion-close-round"></i> 
      ${info[1]}
      <input name="article[tag_ids][]" value=${info[0]} autocomplete="off" type="hidden" id="tag_ids">
    `
    tagList.appendChild(spanTag)
    tagInput.value = ""
  }
}

function addTagEvent(element){
  element.addEventListener("click", () => {
    element.parentNode.removeChild(element)
  });
}