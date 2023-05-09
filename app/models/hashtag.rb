class Hashtag < ApplicationRecord
  HASHTAG_REGEX = /#[[:word:]-]+/.freeze

  has_many :hashtags_questions, dependent: :destroy
  has_many :questions, through: :hashtags_questions

  before_validation :downcase_body

  scope :with_questions, -> { where_exists(:hashtags_questions) }

  validates :body, presence: true

  private
  def downcase_body
    body&.downcase!
  end
end
