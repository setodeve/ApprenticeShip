import Image from "next/image";
import styles from "./page.module.css";
import Link from 'next/link'

export default async function Home() {
  const data = await getData();
  console.log(data)
  const articles = data["articles"]
  const list = []
  return (
    <main>
      <div className="home-page">
        <div className="banner">
          <div className="container">
            <h1 className="logo-font">conduit</h1>
            <p>A place to share your knowledge.</p>
          </div>
        </div>
        
        <div className="container page">
          <div className="row">
            <div className="col-md-9">
              <div className="feed-toggle">
                <ul className="nav nav-pills outline-active">
                  <li className="nav-item">
                    <a className="nav-link" href="">Your Feed</a>
                  </li>
                  <li className="nav-item">
                    <a className="nav-link active" href="">Global Feed</a>
                  </li>
                </ul>
              </div>
              {
                (() => {
                articles.forEach(a => {
                    list.push(
                      <div className="article-preview">
                      <div className="article-meta">
                        <a href=""><img src="http://i.imgur.com/Qr71crq.jpg" /></a>
                        <div className="info">
                          <a href="" className="author">{a["author"]["name"]}</a>
                          <span className="date">{a["created_at"]}</span>
                        </div>
                        <button className="btn btn-outline-primary btn-sm pull-xs-right">
                          <i className="ion-heart"></i> 29
                        </button>
                      </div>
                      <Link href={"/articles/" + a["slug"]} className="preview-link">
                        <h1>{a["title"]}</h1>
                        <p>{a["description"]}</p>
                        <span>Read more...</span>
                        <ul className="tag-list">
                          {
                          (() => {
                            let count = 1
                            // console.log(a["tagList"])
                            const tagList = []
                            a["tagList"].forEach(t => {
                              tagList.push(<li key={count} className="tag-default tag-pill tag-outline">{t}</li>)
                              count+=1
                            })
                            return tagList
                          })()
                          }
                          </ul>
                      </Link>
                    </div>
                    )
                })
                return list
              })()}

              <ul className="pagination">
                <li className="page-item active">
                  <a className="page-link" href="">1</a>
                </li>
                <li className="page-item">
                  <a className="page-link" href="">2</a>
                </li>
              </ul>
            </div>

            <div className="col-md-3">
              <div className="sidebar">
                <p>Popular Tags</p>

                <div className="tag-list">
                  <a href="" className="tag-pill tag-default">programming</a>
                  <a href="" className="tag-pill tag-default">javascript</a>
                  <a href="" className="tag-pill tag-default">emberjs</a>
                  <a href="" className="tag-pill tag-default">angularjs</a>
                  <a href="" className="tag-pill tag-default">react</a>
                  <a href="" className="tag-pill tag-default">mean</a>
                  <a href="" className="tag-pill tag-default">node</a>
                  <a href="" className="tag-pill tag-default">rails</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}

async function getData() {
  const res = await fetch('http://localhost:3000/api/articles')
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }
  return res.json()
}
 