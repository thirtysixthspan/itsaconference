class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.string :author
      t.string :affiliation
      t.string :email
      t.text :biography
      t.string :photo
      
      t.string :title
      t.string :theme
      t.text :abstract
      t.text :comments

      t.string :agreed_to_terms, :default=> 'no'

      t.string :status, :default=>'pending review'
      t.datetime :start_time
      t.integer :duration
      t.string :slides
      t.string :video

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
