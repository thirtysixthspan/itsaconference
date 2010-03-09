class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :question_id
      t.string :response
      t.integer :purchase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
