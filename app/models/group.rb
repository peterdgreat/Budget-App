class Group < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  has_and_belongs_to_many :spendings
  validates :name, presence: true
end
