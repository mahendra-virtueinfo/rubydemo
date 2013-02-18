class Product < ActiveRecord::Base
  has_many :picture, :as => :imageable, :dependent => :destroy

  attr_accessible :name, :picture_attributes
  accepts_nested_attributes_for :picture, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates :name, :presence => { :message => "Name required" }

  validates_associated :picture
  validates :picture, :presence => true
end
