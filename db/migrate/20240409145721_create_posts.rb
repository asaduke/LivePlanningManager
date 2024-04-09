class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :comment
      t.boolean :is_anonymous
      t.references :lives, null: false, foreign_key: true
      t.references :packing_items, null: false, foreign_key: true

      t.timestamps
    end
  end
end
