class Live < ApplicationRecord
  has_many :packing_items, dependent: :destroy
end
