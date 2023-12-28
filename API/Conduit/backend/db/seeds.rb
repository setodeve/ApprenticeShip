tags = ['realworld','implementations','programming', 'javascript', 'emberjs', 'angularjs', 'react', 'mean', 'node', 'rails']

tags.each do |tag|
  Tag.create!(name: tag)
end

5.times do |n|

  savetag = []
  2.times do
    tag = Tag.find(rand(1..tags.length)).id
    if !savetag.include?(tag) 
      savetag << tag
    end
  end

  Article.create!(
    title: 'タイトル',
    description: 'descriptiondescription',
    body: 'テキストテキストテキストテキスト',
    tag_ids: savetag
  )
end

# rails db:migrate:reset
# rails db:seed