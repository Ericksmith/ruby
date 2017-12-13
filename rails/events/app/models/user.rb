class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :events_attending, through: :attendees, source: :event
  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  before_save :downcase_fields
  
  def downcase_fields
    self.email.downcase!
  end
end
