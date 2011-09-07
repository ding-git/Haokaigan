class AddLogsColumn < ActiveRecord::Migration
  def up
        add_column :logs, :l_type, :string
  end

  def down
        remove_column :logs, :l_type
  end
end
