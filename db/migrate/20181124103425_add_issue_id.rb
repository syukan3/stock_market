class AddIssueId < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :issue_id, :integer

  end
end
