class UserDetail < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :facebook_id, :phone, :twitter_id
  validates :address, :phone, :facebook_id, :presence => true
end
