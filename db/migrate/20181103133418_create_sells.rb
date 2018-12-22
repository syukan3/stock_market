class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.integer :price
      t.integer :amount
      t.integer :user_id
      t.integer :issue_id

      t.timestamps
    end
  end
end
