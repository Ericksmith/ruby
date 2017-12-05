class User < ActiveRecord::Base
  has_many :friends, :foreign_key => "user_id", :class_name => "Friend"
  has_many :friends, :through => :friends
end
