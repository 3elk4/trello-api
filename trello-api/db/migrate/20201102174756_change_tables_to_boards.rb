class ChangeTablesToBoards < ActiveRecord::Migration[6.0]
  def change
    rename_table :tables, :boards
  end
end
