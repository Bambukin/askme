class Hashtag < ApplicationRecord
  HASHTAG_REGEX = /\A#[[:word:]-]+\z/.freeze
  has_and_belongs_to_many :questions

  before_validation :downcase_body

  validates :body, format: { with: HASHTAG_REGEX }

  def downcase_body
    body&.downcase!
  end
end
