class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.boolean :is_public, default: "false", null: false

      t.timestamps
    end
  end
end
