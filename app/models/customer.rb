class Customer < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone, :street

  validates :name, :presence => { :message => "Please enter name" },
          :length => { :in => 3..20,
                       :too_short => "must have at least %{count} characters",
                       :too_long  => "must have at most %{count} characters" }
    validates :email, :uniqueness => { :message => "Email already exists" }, :presence => { :message => "Please enter email" }, :email => { :message => "Invalid email address" }
      validates :phone, :presence => { :message => "Please enter phone" }, :numericality => { :only_integer => true, :message => "Must be only numerical" }
        validates :address, :presence => { :message => "Please enter address" }
          validates :street, :presence => { :message => "Please enter street" }

end
