class Card < ApplicationRecord
    belongs_to :list
    has_many :card_comments
end
