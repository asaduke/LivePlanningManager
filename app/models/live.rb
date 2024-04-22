class Live < ApplicationRecord
  has_many :packing_items, dependent: :destroy
  belongs_to :user
  has_one :post, dependent: :destroy

  validates :title, presence: true
end
