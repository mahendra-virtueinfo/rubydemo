class Employee < ActiveRecord::Base
  has_one :picture, :as => :imageable, :dependent => :destroy

  attr_accessible :name, :picture_attributes
  accepts_nested_attributes_for :picture, :allow_destroy => true

  validates :name, :presence => { :message => "Name required" }

  validates_associated :picture
  validates :picture, :presence => true
end
