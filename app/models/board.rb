class Board < ApplicationRecord

    include Rails.application.routes.url_helpers

    has_many :lists, dependent: :destroy
    belongs_to :user
    has_one_attached :background

    def get_background_url
        url_for(self.background)
    end
end
