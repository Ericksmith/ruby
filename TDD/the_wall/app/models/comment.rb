class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :message, length: {minimum: 10}
  validates :user_id, :post_id, :message, presence: true
end
