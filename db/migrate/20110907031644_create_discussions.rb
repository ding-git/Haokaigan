class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :note_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
