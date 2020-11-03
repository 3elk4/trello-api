class AddListFkToCard < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :list, index: true
    add_foreign_key :cards, :lists
  end
end
