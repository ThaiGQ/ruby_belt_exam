class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :lender, index: true, foreign_key: true
      t.references :borrower, index: true, foreign_key: true
      t.integer :amount_loaned

      t.timestamps null: false
    end
  end
end
