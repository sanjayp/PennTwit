class User < ActiveRecord::Base
has_many :microposts
attr_accessible :firstname, :lastname, :email, :location, :timezone, :bio, :privacy, :webpage
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :firstname, :presence => true
validates :email, :presence => true,
                  :format   => { :with => email_regex }
end
