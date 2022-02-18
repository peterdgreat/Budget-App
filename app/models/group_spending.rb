class GroupSpending < ApplicationRecord
  belongs_to :group
  belongs_to :spending
  validates :group_id, presence: true
  validates :spending_id, presence: true
end
