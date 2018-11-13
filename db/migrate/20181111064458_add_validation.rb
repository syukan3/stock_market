class AddValidation < ActiveRecord::Migration[5.2]
  def change
    add_index :issues, :stock_number, unique: true
  end
end
