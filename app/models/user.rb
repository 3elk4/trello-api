class User < ApplicationRecord

    include Rails.application.routes.url_helpers

    has_secure_password
    has_many :boards
    has_many :blacklisted_tokens, dependent: :delete_all
    has_one_attached :avatar

    PASSWORD_FORMAT = /\A
        (?=.{8,})
        (?=.*\d)
        (?=.*[a-z])
        (?=.*[A-Z])
        (?=.*[[:^alnum:]])
    /x

    validates :password, presence: true, length: {in: 8..20}, format: {with: PASSWORD_FORMAT}, on: :create

    def get_avatar_url
      rails_blob_path(self.avatar, only_path: true) 
    end

    
end
