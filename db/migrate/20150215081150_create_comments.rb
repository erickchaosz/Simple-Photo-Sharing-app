class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :photo_id
      t.string :date_time
      t.text :comment 

      t.timestamps null: false
    end
  end
end
