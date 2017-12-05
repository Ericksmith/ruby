class Dojo < ActiveRecord::Base
  validates :branch, :city, :state, :street, presence: true
end
