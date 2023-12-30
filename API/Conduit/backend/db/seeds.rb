tags = ['realworld','implementations','programming', 'javascript', 'emberjs', 'angularjs', 'react', 'mean', 'node', 'rails']

tags.each do |tag|
  Tag.create!(name: tag)
end

5.times do |n|

  user = User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: "foobar",
    password_confirmation: "foobar"
  )

  savetag = []
  2.times do
    tag = Tag.find(rand(1..tags.length)).id
    if !savetag.include?(tag) 
      savetag << tag
    end
  end

  article = Article.create!(
    title: 'タイトル',
    slug: '',
    description: 'descriptiondescription',
    body: 'テキストテキストテキストテキスト',
    user_id: user.id,
    tag_ids: savetag
  )
  article.slug = article.title.gsub(" ","-")+"-"+String(article.id)
  article.save
end

# rails db:migrate:reset
# rails db:seed