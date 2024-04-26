class RemoveLivesIdBigintFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :lives_id, :bigint
  end
end
