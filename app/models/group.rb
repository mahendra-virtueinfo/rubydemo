class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :user_group
  has_many :user, :through => :user_group
end
