class User < ApplicationRecord
    has_secure_password
    has_many :boards
    has_one_attached :avatar
end
