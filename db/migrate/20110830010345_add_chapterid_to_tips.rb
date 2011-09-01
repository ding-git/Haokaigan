class AddChapteridToTips < ActiveRecord::Migration
  def self.up
    add_column :tips, :chapter_id, :integer
  end
 
  def self.down
    remove_column :tips, :chapter_id
  end
end
