tags = ['realworld','implementations','programming', 'javascript', 'emberjs', 'angularjs', 'react', 'mean', 'node', 'rails']

tags.each do |tag|
  Tag.create!(name: tag)
end

5.times do |n|
  user = User.create(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}"
  )
  user.image.attach(io: File.open(Rails.root.join('app/assets/images/pexels-julia-fuchs-9367332.jpg')), filename: 'pexels-julia-fuchs-9367332.jpg')
# Julia Fuchsによる写真: https://www.pexels.com/ja-jp/photo/9367332/
  user.save!
  
  savetag = []
  2.times do
    tag = Tag.find(rand(1..tags.length)).id
    if !savetag.include?(tag) 
      savetag << tag
    end
  end

  Article.create!(
    title: 'タイトル',
    content: 'テキストテキストテキストテキスト',
    user_id: user.id,
    tag_ids: savetag
  )
end

