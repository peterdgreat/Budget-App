class Group < ApplicationRecord
  belongs_to :user
  has_many :spendings
  validates :name, presence: true
end
