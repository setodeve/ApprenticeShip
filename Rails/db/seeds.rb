5.times do |n|
  user = User.create(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}"
  )
  user.image.attach(io: File.open(Rails.root.join('app/assets/images/pexels-julia-fuchs-9367332.jpg')), filename: 'pexels-julia-fuchs-9367332.jpg')
  user.save!

  Article.create!(
    title: 'タイトル',
    content: 'テキストテキストテキストテキスト',
    user_id: user.id
  )
end

# Julia Fuchsによる写真: https://www.pexels.com/ja-jp/photo/9367332/