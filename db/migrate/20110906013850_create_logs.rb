class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :type
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :note_id

      t.timestamps
    end
  end
end
