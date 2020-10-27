class AddTableFkToList < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :table, index: true
    add_foreign_key :lists, :tables
  end
end
