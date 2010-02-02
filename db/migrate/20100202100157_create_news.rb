class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.string :author
      t.text :post
      t.datetime :post_date

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
