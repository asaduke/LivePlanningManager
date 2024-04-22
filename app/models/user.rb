class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :lives, class_name: 'Live', dependent: :destroy
  has_many :packing_items, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :posts, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  def own?(object)
    id == object.user_id
  end
end
