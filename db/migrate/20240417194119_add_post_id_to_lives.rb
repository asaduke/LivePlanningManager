class AddPostIdToLives < ActiveRecord::Migration[7.0]
  def change
    add_reference :lives, :post, foreign_key: true
  end
end
