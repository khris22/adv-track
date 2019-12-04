class Location < ApplicationRecord
    has_many :adventures
    has_many :users, through: :adventures

    validates :state, presence: true
end
