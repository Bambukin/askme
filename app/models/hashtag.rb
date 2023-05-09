class Hashtag < ApplicationRecord
  HASHTAG_REGEX = /#[[:word:]-]+/.freeze

  has_and_belongs_to_many :questions

  before_validation :downcase_body

  scope :with_questions, -> { where_exists(:questions) }

  validates :text, presence: true

  private
  def downcase_body
    body&.downcase!
  end
end
