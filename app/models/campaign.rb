class Campaign < ActiveRecord::Base
  attr_accessible :description, :name, :price

  validates :name, :price, :description, :presence => true
end
