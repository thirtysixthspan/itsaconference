class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string :title
      t.string :link      
      t.string :icon
      t.string :one_line_description
      t.text :short_description
      t.text :long_description

      t.timestamps
    end
  end

  def self.down
    drop_table :themes
  end
end
