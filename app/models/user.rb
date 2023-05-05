class User < ApplicationRecord
  include Gravtastic

  DEFAULT_NAVBAR_COLOR = '#370617'.freeze
  COLOR_REGEX = /\A#\h{3}{1,2}\z/.freeze
  NICKNAME_REGEX = /\A\w+\z/.freeze

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: 'Question', foreign_key: :author_id, dependent: :nullify

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, email: true
  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: NICKNAME_REGEX }
  validates :navbar_color, format: { with: COLOR_REGEX }, presence: true

  gravtastic(secure: true, filetype: :png, size: 100, default: 'mp')

  has_secure_password

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
