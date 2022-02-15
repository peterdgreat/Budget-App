class Spending < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :group
  validates :name, presence: true
  validates :amount, presence: true
end
