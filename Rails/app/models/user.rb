class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_one_attached :image
end
