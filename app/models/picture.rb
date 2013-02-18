class Picture < ActiveRecord::Base
  attr_accessible :image
  belongs_to :imageable, :polymorphic => true

  has_attached_file :image, :styles => { :small => "50x50>" },
                    :url => "/assets/:attachment/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/:attachment/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes

end
