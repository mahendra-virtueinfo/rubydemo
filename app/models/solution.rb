class Solution < ActiveRecord::Base
  attr_accessible :description, :name, :price

  validates :name, :presence => { :message => "Please enter name" }
  validates :description, :presence => { :message => "Please enter description" }
  validates :price, :presence => { :message => "Please enter price" }

  validates_length_of :name, :within => 1..20, :message => "Please enter at least 20 character"
end
