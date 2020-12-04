class AddArchivingDateToList < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :archiving_date, :datetime, default: nil
  end
end
