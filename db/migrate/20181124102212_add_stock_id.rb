class AddStockId < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :stock_id, :integer
  end
end
