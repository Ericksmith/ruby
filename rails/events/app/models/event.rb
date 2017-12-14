class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
  validates :name, :date, :city, :state, :user_id, presence: true
  validates :date, inclusion: { in: (Date.today..Date.today+5.years), message:"can not be in the past" }
end
