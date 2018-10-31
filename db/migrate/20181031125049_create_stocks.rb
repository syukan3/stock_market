class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :current_price
      t.integer :max_price
      t.integer :min_price
      t.integer :start_price
      t.integer :end_price
      t.date :date

      t.timestamps
    end
  end
end
