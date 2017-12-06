class Dojo < ActiveRecord::Base
  validates :branch, :city, :state, :street, presence: true
  has_many :students
end
