class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.decimal :amount, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
