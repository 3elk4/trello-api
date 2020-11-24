class AddArchivingDateToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :archiving_date, :datetime, :default => nil
  end
end
