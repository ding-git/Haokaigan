class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :message
      t.string :unread

      t.timestamps
    end
  end
end
