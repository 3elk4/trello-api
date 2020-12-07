class CreateCardsLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :cards_labels do |t|
      t.references :card, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
