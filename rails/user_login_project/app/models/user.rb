class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :age, presence: true
  validates :age, numericality: { only_integer: true }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates_numericality_of :age, greater_than_or_equal_to: 2
  validates_numericality_of :age, less_than: 150
end
