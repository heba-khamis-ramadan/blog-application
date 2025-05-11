class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :title, :body, :tags, presence: true
  validate :must_have_at_least_one_tag

    private
    def must_have_at_least_one_tag
      if tags.blank? || tags.reject(&:blank?).empty?
        errors.add(:tags, 'must have at least one tag')
      end
    end

end
