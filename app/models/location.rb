class Location < ApplicationRecord
    has_many :adventures
    has_many :users, through: :adventures
    has_many :categories, through: :adventures

    validates :city, :state, presence: true

    default_scope { order(city: :asc)}

end
