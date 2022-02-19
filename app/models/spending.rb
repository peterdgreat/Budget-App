class Spending < ApplicationRecord
  belongs_to :user
  has_many :group_spendings, dependent: :delete_all
  has_many :groups, through: :group_spendings
  validates :name, presence: true
  validates :amount, presence: true
end
