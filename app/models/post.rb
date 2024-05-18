class Post < ApplicationRecord
  belongs_to :user
  belongs_to :live

  def self.ransackable_attributes(auth_object = nil)
    ["comment", "created_at", "id", "is_anonymous", "live_id", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["live", "user"]
  end
end
