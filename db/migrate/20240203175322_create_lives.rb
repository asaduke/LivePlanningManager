class CreateLives < ActiveRecord::Migration[7.0]
  def change
    create_table :lives do |t|
      t.string :title, null: false
      t.string :place
      t.date :date
      t.time :open_time
      t.time :start_time
      t.datetime :departure_time

      t.timestamps null: false
    end
  end
end
