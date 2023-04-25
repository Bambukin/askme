class User < ApplicationRecord
  DEFAULT_NAVBAR_COLOR = '#370617'.freeze
  COLOR_REGEX = /\A#(\h{3}){1,2}\z/.freeze

  before_validation :downcase_nickname

  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\z/ }
  validates :navbar_color, format: { with: COLOR_REGEX }, presence: true

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: 'Question', foreign_key: :author_id, dependent: :nullify

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'mp')

  def to_param
    nickname
  end

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
