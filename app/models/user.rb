class User < ApplicationRecord
  DEFAULT_NAVBAR_COLOR = '#370617'

  before_validation :downcase_nickname

  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\z/ }
  validates :navbar_color, format: { with: /\A#(\h{3,6})\z/ }, presence: true

  has_many :questions, dependent: :delete_all

  private

  def downcase_nickname
    nickname.downcase!
  end
end
