class Live < ApplicationRecord
  has_many :packing_items, dependent: :nullify
  belongs_to :user

  validates :title, presence: true
end
