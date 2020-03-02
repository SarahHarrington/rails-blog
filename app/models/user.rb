class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
                    length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end
end