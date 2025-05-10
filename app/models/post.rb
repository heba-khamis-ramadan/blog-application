class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :tags, presence: true

  serialize :tags, Array  # or use jsonb in migration for better querying
end
