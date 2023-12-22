const tagInput = document.getElementById('tag-input')
const tagEvent = document.getElementsByClassName('tag-event')
tagInput.addEventListener("keypress", (e) => addTag(e));
tagInput.removeEventListener("keypress", (e) => addTag(e));

if (tagEvent != undefined) {
  for(let i = 0; i < tagEvent.length; i++) {addTagEvent(tagEvent[i])}
}

function addTag(e){
  const tagOption = document.getElementsByClassName('tag-option')
  const tagList = document.getElementById('tag-list')
  if (e.key === "Enter") {
    e.preventDefault();
    
    let info = e.target.value.split(',')
    if(info.length!=2){
      info.unshift(tagOption.length+1)
    }

    for(let i=0 ; i<tagOption.length;i++){
      if (tagOption[i].value.split(',')[1] == info[1]){
         return
      }
    }
    const spanTag = document.createElement('span')
    spanTag.classList.add("tag-default","tag-pill","tag-event")
    addTagEvent(spanTag)
    spanTag.innerHTML = `
      <i class="ion-close-round"></i> 
      ${info[1]}
      <input name="article[tag_ids][]" value=${info[0]} autocomplete="off" type="hidden" id="tag_ids">
      <input name="tag_names[]" value=${info[1]} autocomplete="off" type="hidden" id="tag_ids">
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