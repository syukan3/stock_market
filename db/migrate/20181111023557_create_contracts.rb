class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.integer :user_id
      t.integer :stock_number
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end
