class RemoveForeignKeyAndIndexFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, column: :packing_items_id
    remove_index :posts, column: :packing_items_id
    remove_column :posts, :packing_items_id
  end
end
