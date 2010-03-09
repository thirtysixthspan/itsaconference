class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :item_id
      t.string :query
      t.string :acceptable_responses

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
