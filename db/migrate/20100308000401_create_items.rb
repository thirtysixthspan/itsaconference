class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :current_price, :default=>0, :precision=>8, :scale=>2
      t.integer :quantity_original
      t.integer :quantity_available
      t.datetime :scheduled_time

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
