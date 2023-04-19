class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  before_save :downcase_nickname

  private

  def downcase_nickname
    nickname.downcase!
  end
end
