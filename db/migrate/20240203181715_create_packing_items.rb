class CreatePackingItems < ActiveRecord::Migration[7.0]
  def change
    create_table :packing_items do |t|
      t.string :name, null: false
      t.boolean :is_checked
      t.references :live, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
