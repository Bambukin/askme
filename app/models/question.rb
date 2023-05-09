class Question < ApplicationRecord
  has_many :hashtags_questions, dependent: :destroy
  has_many :hashtags, through: :hashtags_questions
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  validates :body, presence: true, length: { maximum: 280 }
end
