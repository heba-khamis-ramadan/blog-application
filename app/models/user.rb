class User < ApplicationRecord
  has_secure_password

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'commenter_id', dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, :password_digest, presence: true
end
