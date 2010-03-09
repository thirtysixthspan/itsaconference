class CreatePurchasedItems < ActiveRecord::Migration
  def self.up
    create_table :purchased_items do |t|
      t.integer :purchase_id
      t.integer :item_id
      t.decimal :value

      t.timestamps
    end
  end

  def self.down
    drop_table :purchased_items
  end
end
