require 'json'

class CardCommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :content

  def username
    User.find(object.user_id).username
  end
end
