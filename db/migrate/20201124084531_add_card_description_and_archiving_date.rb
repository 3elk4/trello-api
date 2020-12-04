class AddCardDescriptionAndArchivingDate < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :description, :string, default: "" 
    add_column :cards, :archiving_date, :datetime, default: nil
  end
end
