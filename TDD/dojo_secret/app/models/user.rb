class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :email, uniqueness: true
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  before_save :downcase_fields
  
  def downcase_fields
    self.email.downcase!
  end
end
