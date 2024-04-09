class Post < ApplicationRecord
  has_many :lives, dependent: :destroy
  has_many :packing_items, dependent: :destroy
end
