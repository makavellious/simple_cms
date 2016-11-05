class AdminUser < ApplicationRecord

	has_secure_password
	attr_accessor :first_name
	has_many :section_edits
	has_many :sections, :through => :section_edits

	before_save 

	EMAIL_REGEX =/\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :first_name, :presence => true,
	                       :length => {:maximum => 25}
	validates :last_name,  :presence => true,
	                       :length => {:maximum => 50}
  validates :username,	 :presence => true,
  											 :uniqueness => true 	
	validates :email,      :presence => true,
												 :length => { :maximum => 50},
												 :uniqueness => true,
												 :format => {:with => EMAIL_REGEX},
												 :confirmation => true
end
