class PackingItem < ApplicationRecord
  belongs_to :live
  belongs_to :user

  validates :name, presence: true
end
