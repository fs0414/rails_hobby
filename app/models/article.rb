class Article < ApplicationRecord
  # has_many :comments, dependent: :destroy
  # belongs_to :user

  validates :title, presence: true
end
