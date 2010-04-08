class CreateDiscounts < ActiveRecord::Migration
  def self.up
    create_table :discounts do |t|
      t.string :name
      t.string :code
      t.decimal :percent
      t.boolean :public

      t.timestamps
    end
  end

  def self.down
    drop_table :discounts
  end
end
