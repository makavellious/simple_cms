class AdminUser < ApplicationRecord
	attr_accessor :first_name
	has_many :section_edits
	has_many :sections, :through => :section_edits
end
