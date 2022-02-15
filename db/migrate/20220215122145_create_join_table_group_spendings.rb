class CreateJoinTableGroupSpendings < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :spendings do |t|
      t.index [:group_id, :spending_id]
      t.index [:spending_id, :group_id]
    end
  end
end
