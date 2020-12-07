class Label < ApplicationRecord
    has_many :cards_labels, dependent: :destroy
    has_many :cards, through: :cards_labels
end
