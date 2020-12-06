class AddIfDeadlineIsMetColumnToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :is_deadline_met, :boolean, default: false
  end
end
