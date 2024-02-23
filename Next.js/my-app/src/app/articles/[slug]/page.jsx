// 'use client'
import dynamic from 'next/dynamic';
// import { useRouter } from 'next/router'
export default async function Article({ params }) {
  const DynamicComponent = dynamic(() => import('../../component/articleButton'),{ssr: false});
  const data = await getData(params["slug"]);
  const article = data["article"]
  return (
    <div className="article-page">
      <div className="banner">
        <h1>{article["title"]}</h1>
        <DynamicComponent data={data} />
      </div>

      <div className="container page">
        <div className="row article-content">
          <div className="col-md-12">
            <p>
              {article["description"]}
            </p>
            <h2 id="introducing-ionic">Introducing RealWorld.</h2>
            <p>{article["body"]}</p>
            <ul className="tag-list">
              {
                (() => {
                  let count = 1
                  const tagList = []
                  article["tagList"].forEach(t => {
                    tagList.push(<li key={count} className="tag-default tag-pill tag-outline">{t}</li>)
                    count+=1
                  })
                  return tagList
                })()
              }
            </ul>
          </div>
        </div>

        <hr />

        <div className="article-actions">
            <DynamicComponent data={data} />
        </div>
      </div>
    </div>
  );
}

async function getData(slug) {
  const res = await fetch('https://setokei.site/api/articles/'+ decodeURIComponent(slug))
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }
  return res.json()
}

