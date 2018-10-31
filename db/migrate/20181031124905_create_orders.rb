class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :price
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
