class AddUserFkToTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :tables, :user, index: true
    add_foreign_key :tables, :users
  end
end
