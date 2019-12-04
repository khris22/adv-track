class User < ApplicationRecord
    has_secure_password
    has_many :adventures
    has_many :locations, through: :adventures
end
