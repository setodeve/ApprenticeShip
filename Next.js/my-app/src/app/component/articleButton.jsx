'use client'
import { useRouter } from 'next/navigation'
import { useState } from "react";
export default function Page(data) {
  const [token,setToken] = useState(localStorage.getItem("ConduitToken"))
  const router = useRouter()
  const article = data["data"]["article"]
  const slug = article["slug"]

  return (
    <div className="container">
    <div className="article-meta">
      <a href="/profile/eric-simons"><img src="http://i.imgur.com/Qr71crq.jpg" /></a>
      <div className="info">
        <a href="/profile/eric-simons" className="author">{article["author"]["name"]}</a>
        <span className="date">{article["created_at"]}</span>
      </div>
      <button className="btn btn-sm btn-outline-secondary">
        <i className="ion-plus-round"></i>
        &nbsp; Follow {article["author"]["name"]} <span className="counter">(10)</span>
      </button>
      &nbsp;&nbsp;
      <button className="btn btn-sm btn-outline-primary">
        <i className="ion-heart"></i>
        &nbsp; Favorite Post <span className="counter">(29)</span>
      </button>
      <button className="btn btn-sm btn-outline-secondary">
        <i className="ion-edit"></i> Edit Article
      </button>
      <button onClick={() => deleteArticle(slug,router,token)} 
        className="btn btn-sm btn-outline-danger"
      >
        <i className="ion-trash-a"></i> Delete Article
      </button>
    </div>
  </div>
  )
}

async function deleteArticle(slug,router,token){

  const res = await fetch('https://setokei.site/api/articles/'+ decodeURIComponent(slug),{
    method: 'delete',
    headers: { 
      'Content-Type': 'application/json',
      'Authorization': token
    }
  })
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }
  router.push('/')
}