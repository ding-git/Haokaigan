class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :establish_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
