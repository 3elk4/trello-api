require 'json'

class CardCommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :content

  def username
    print "JSON HERE"
    print(object.to_json)
    User.find(object.user_id).username
  end
end
