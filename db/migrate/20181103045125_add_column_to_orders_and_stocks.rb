class AddColumnToOrdersAndStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :stock_number, :integer
    add_column :stocks, :stock_number, :integer
  end
end
