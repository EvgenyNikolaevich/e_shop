# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :amount
      t.datetime :completed_at
      t.belongs_to :merchant, null: false, foreign_key: true
      t.belongs_to :shopper, null: false, foreign_key: true

      t.timestamps
    end
  end
end
