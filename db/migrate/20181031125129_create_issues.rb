class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.integer :stock_number
      t.string :company_name

      t.timestamps
    end
  end
end
