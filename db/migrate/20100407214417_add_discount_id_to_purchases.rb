class AddDiscountIdToPurchases < ActiveRecord::Migration
  def self.up
    add_column :purchases, :discount_id, :integer
  end

  def self.down
    remove_column :purchases, :discount_id
  end
end
