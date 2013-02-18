class Category < ActiveRecord::Base
  attr_accessible :lft, :name, :parent_id, :rgt
  acts_as_nested_set

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
