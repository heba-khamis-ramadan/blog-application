class Comment < ApplicationRecord
  belongs_to :commenter, class_name: 'User'
  belongs_to :post

  validates :content, presence: true
end
