class Section < ApplicationRecord
has_many :section_edits
has_many :admin_users, :through => :section_edits
belongs_to :page

scope :visible, lambda {where(:visible => true)}
scope :invisible, lambda {where(:visible => false)}
scope :sorted, lambda {order("position ASC")}
scope :newest_first, lambda {order("created_at DESC")}
scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
