class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  # belongs_to :article
end
