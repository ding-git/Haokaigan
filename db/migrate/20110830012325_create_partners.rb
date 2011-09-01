class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :partner_link
      t.text :content
      t.integer :chapter_id

      t.timestamps
    end
  end
end
