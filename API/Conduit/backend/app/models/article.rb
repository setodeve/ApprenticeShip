class Article < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  belong_to :user
  # has_and_belongs_to_many :tags

  # def render_json(a)
  #   return a.merge({
  #     tagList: tags.pluck(:name)
  #   })
  # end


end
