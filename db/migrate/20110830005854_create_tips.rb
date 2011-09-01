class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :name
      t.string :tips_link
      t.text :content

      t.timestamps
    end
  end
end
