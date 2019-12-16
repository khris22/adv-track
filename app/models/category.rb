class Category < ApplicationRecord
    has_many :adventures
    has_many :locations, through: :adventures
end
