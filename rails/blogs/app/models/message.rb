class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :imageable
  validates :author, :message, presence: true
  validates :message, length: {minimum: 15}
end
