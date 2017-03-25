class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :loan_name
      t.text :loan_detail
      t.integer :capital_needed
      t.integer :capital_raised

      t.timestamps null: false
    end
  end
end
