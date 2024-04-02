class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.string :avatar
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
