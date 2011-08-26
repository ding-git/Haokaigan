class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :chapter_id
      t.string :que
      t.text :ans
      t.string :img_url

      t.timestamps
    end
  end
end
