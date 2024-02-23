"use client";
import { useRouter } from 'next/navigation'
import { useState } from "react";

export default function CreateArticle() {
  const [token,setToken] = useState(localStorage.getItem("ConduitToken"))
  const router = useRouter()
  const handleSubmit = async (e,router) => {
    e.preventDefault()
    const formData = new FormData(e.currentTarget)
    
    const response = await fetch('https://setokei.site/api/articles/', {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json',
        'Authorization': token
      },
      body: JSON.stringify(
      {
        "article":{
          "title":"How to train your dragaons", 
          "description":"Ever wonder how?", 
          "body":"Very carefully.", 
          "user_id":1, 
          "tagList":["training", "dragons"]
        }
      }),
    })
    
    const res = await response.json()

    if (response.ok) {
      router.push('/')
    } else {
      router.push('/articles/new')
    }
  
  }
  return (
    <div className="editor-page">
      <div className="container page">
        <div className="row">
          <div className="col-md-10 offset-md-1 col-xs-12">
            <ul className="error-messages">
              <li>That title is required</li>
            </ul>

            <form onSubmit={(e) => handleSubmit(e,router)}>
              <fieldset>
                <fieldset className="form-group">
                  <input type="text" name='title' className="form-control form-control-lg" placeholder="Article Title" />
                </fieldset>
                <fieldset className="form-group">
                  <input type="text" name='description' className="form-control" placeholder="What's this article about?" />
                </fieldset>
                <fieldset className="form-group">
                  <textarea
                    className="form-control"
                    name='body'
                    rows="8"
                    placeholder="Write your article (in markdown)"
                  ></textarea>
                </fieldset>
                <fieldset className="form-group">
                  <input type="text" className="form-control" placeholder="Enter tags" />
                  <div className="tag-list">
                    <span className="tag-default tag-pill"> <i className="ion-close-round"></i> tag </span>
                  </div>
                </fieldset>
                <button type="submit" className="btn btn-lg pull-xs-right btn-primary">
                  Publish Article
                </button>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}