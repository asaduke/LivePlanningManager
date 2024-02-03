class PackingItem < ApplicationRecord
  belongs_to :live

  validates :name, presence: true
end
