class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  validates :content, length: {minimum: 10}
  validates :user_id, :content, presence: true 
  # validates_associated :user
end
