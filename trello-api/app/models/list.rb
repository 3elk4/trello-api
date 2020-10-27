class List < ApplicationRecord
    belongs_to :table
    has_many :cards
end
