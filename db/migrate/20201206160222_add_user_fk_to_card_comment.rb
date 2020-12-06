class AddUserFkToCardComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :card_comments, :user, index: true
    add_foreign_key :card_comments, :users
  end
end
