class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_table :table_group_spendings, :group_spendings
  end
end
