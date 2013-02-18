class Books < ActiveRecord::Base
  attr_accessible :author, :name
  validates :name, :author, :presence => true
  validates_length_of :name, :within => 1..20
  validates_uniqueness_of :name, :message => "already exists", :if => :name?

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
