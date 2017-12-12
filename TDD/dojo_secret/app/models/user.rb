class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true
  before_save :downcase_fields
  
  def downcase_fields
    self.email.downcase!
  end
end
