class User < ApplicationRecord
  DEFAULT_NAVBAR_COLOR = '#370617'
  before_validation :downcase_nickname

  private

  def downcase_nickname
    nickname.downcase!
  end

  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\z/ }

  has_many :questions
end
