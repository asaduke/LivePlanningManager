class Live < ApplicationRecord
  has_many :packing_items, dependent: :destroy
  belongs_to :user
  has_one :post, dependent: :destroy

  validates :title, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "departure_time", "id", "open_time", "place", "post_id", "start_time", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["packing_items", "post", "user"]
  end
end
