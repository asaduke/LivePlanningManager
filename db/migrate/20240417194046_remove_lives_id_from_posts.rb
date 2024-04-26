class RemoveLivesIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, column: :lives_id
  end
end
