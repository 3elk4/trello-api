class AddDeadlineToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :deadline, :datetime, default: nil
  end
end
