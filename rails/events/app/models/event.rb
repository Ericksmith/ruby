class Event < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :attendees
  validates :name, :date, :city, :state, presence: true
end
