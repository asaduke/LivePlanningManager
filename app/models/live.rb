class Live < ApplicationRecord
  has_many :packing_items, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
end
