class AddListPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :position, :integer, default: 0, null: false
  end
end
