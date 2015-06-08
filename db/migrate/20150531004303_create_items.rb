class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.date :purchased
      t.date :expiration
      t.string :location
      t.integer :room_id
      t.string :photo
      t.integer :user_id
      t.string :link

      t.timestamps

    end
  end
end
