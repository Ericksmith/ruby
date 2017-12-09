class User < ActiveRecord::Base
  has_many :post
  has_many :comment
  validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
end
