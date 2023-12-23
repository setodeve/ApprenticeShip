require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'article' do
    it "Article作成" do
      tag1 = Tag.create!(name:'important')
      tag2 = Tag.create!(name:'Ruby')
      user = User.create(email: "test@test.com",name: "テスト太郎")
      user.image.attach(io: File.open(Rails.root.join('app/assets/images/pexels-julia-fuchs-9367332.jpg')), filename: 'pexels-julia-fuchs-9367332.jpg')
      user.save!
      article = Article.create!( title: 'titlecontent', content: 'testcontent',user_id: user.id, tag_ids:[tag1.id,tag2.id])
      expect(article.title).to eq 'titlecontent'
    end
  end
end