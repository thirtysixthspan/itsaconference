class Item < ActiveRecord::Base

 has_many :purchased_items 
 has_many :purchases, :through => :purchased_items
 has_many :questions

end
