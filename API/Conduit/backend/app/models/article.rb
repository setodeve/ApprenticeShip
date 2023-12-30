class Article < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  belongs_to :user
  # has_and_belongs_to_many :tags
  scope :fitler_by_tag, ->(name) { joins(:tags).where('tags.name = ?', name) }
  scope :fitler_by_user, ->(name) { joins(:user).where('users.name = ?', name) }

  def render_json()
    self.as_json.merge({
      author: user,
      tagList: tags.map(&:name)
    })
  end

end
