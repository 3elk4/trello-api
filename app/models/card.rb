class Card < ApplicationRecord
    belongs_to :list
    has_many :card_comments

    has_many :cards_labels, dependent: :destroy
    has_many :labels, through: :cards_labels
end
