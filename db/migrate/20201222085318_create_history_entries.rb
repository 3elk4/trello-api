class CreateHistoryEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :history_entries do |t|
      t.text :description
      t.references :user
      t.references :board
      t.datetime :entry_date

      t.timestamps
    end
  end
end
