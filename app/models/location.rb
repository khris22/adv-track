class Location < ApplicationRecord
    has_many :adventures
    has_many :users, through: :adventures

    validates :city, :state, presence: true

    default_scope { order(city: :asc)}

end
