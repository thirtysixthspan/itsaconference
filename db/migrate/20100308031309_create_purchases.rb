class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.string :name
      t.string :job_title
      t.string :affiliation
      t.string :phone
      t.string :email
      t.string :agreed_to_mailings
      t.decimal :payment_amount, :default=>0, :precision=>8, :scale=>2
      t.string :payment_transaction
      t.string :payment_code
      t.string :payment_status
      t.datetime :payment_date

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
