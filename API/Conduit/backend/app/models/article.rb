class Article < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  belongs_to :user
  # has_and_belongs_to_many :tags

  def as_json()
    super.merge({
      slug: self.title.downcase.sub(" ","-").concat(self.id),
      author: user,
      tagList: tags.pluck(:name)
    })
  end

end
