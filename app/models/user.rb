class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :user_detail
  has_many :user_group
  has_many :group, :through => :user_group
  accepts_nested_attributes_for :user_detail, :user_group, :group, :allow_destroy => true
  attr_accessible :first_name, :last_name, :gender, :login, :email, :password, :password_confirmation, :is_active, :photo, :user_detail_attributes, :user_group_attributes
  validates :first_name, :presence => { :message => "Please enter First name" }
  validates :last_name, :presence => { :message => "Please enter Last name" }
  validates :gender, :presence => { :message => "Please select gender" }
  validates :login, :presence => { :message => "Please enter login" }
  validates :email, :presence => { :message => "Please enter Email-ID" }

  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url => "/assets/user/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/user/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  acts_as_authentic

  validates_associated :user_detail
  validates :user_detail, :presence => true
end
