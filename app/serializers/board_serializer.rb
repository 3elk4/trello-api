class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :is_public, :archiving_date, :background

  def background
    if object.background.attached? then
      return object.get_background_url
    end
  end
end
