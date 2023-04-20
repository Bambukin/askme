class User < ApplicationRecord
  DEFAULT_NAVBAR_COLOR = '#370617'
  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\z/, message: "only allows latin letters, digits, and underscore" }

  before_save :downcase_nickname

  private

  def downcase_nickname
    nickname.downcase!
  end
end
