class User < ApplicationRecord

    include Rails.application.routes.url_helpers

    has_secure_password
    has_many :boards
    has_one_attached :avatar

    def get_avatar_url
        url_for(self.avatar) 
    end
end
