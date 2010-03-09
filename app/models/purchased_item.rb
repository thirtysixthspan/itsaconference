class PurchasedItem < ActiveRecord::Base

  belongs_to :item
  belongs_to :purchase
  

end
