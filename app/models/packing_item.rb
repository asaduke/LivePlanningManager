class PackingItem < ApplicationRecord
  belongs_to :live
  belongs_to :user
  belongs_to :post

  validates :name, presence: true
end
