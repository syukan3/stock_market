class AddContractsTo < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :issue_id, :integer
  end
end
