class ChangeTableIdToBoardIdInList < ActiveRecord::Migration[6.0]
  def change
    rename_column :lists, :table_id, :board_id
  end
end
