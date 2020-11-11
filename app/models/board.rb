class Board < ApplicationRecord
    has_many :lists, dependent: :destroy
    belongs_to :user
end
