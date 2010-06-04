class CreateCredentials < ActiveRecord::Migration
  def self.up
    create_table :credentials do |t|
      t.string :owner
      t.string :email
      t.string :code
      t.string :access
      t.integer :access_count

      t.timestamps
    end
  end

  def self.down
    drop_table :credentials
  end
end
