class HistoryEntrySerializerSerializer < ActiveModel::Serializer
  attributes :id, :description, :entry_date, :username

  def username
    User.find(object.user_id).username
  end
end
