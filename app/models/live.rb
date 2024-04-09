class Live < ApplicationRecord
  has_many :packing_items, dependent: :destroy
  belongs_to :user
  belongs_to :post

  validates :title, presence: true
end
