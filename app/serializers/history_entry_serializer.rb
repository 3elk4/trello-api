class HistoryEntrySerializer < ActiveModel::Serializer
  attributes :id, :description, :entry_date, :username, :board_id

  def username
    User.find(object.user_id).username
  end
end
