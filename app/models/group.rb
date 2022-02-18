class Group < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  has_many :group_spendings, dependent: :destroy
  has_many :spendings, through: :group_spendings
  validates :name, presence: true
  after_save :amount

  def amount
    result = 0
    spendings.each do |spending|
      result += spending.amount
    end
    result
  end
end
