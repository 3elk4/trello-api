class CreateCardComments < ActiveRecord::Migration[6.0]
  def change
    create_table :card_comments do |t|
      t.text :content
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
