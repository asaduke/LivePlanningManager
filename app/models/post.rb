class Post < ApplicationRecord
  has_many :lives, class_name: 'Live'
  has_many :packing_items
end
