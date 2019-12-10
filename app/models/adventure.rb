class Adventure < ApplicationRecord
    belongs_to :user
    belongs_to :location
    # belongs_to :category 

    accepts_nested_attributes_for :location

    # def location_attributes=(attributes)
    #     location = Location.find_or_create_by(attributes)
    #     self.location = location if location.valid? || !self.location
    # end

    scope :is_wishlist?, -> { where(is_wishlist?: true)}

    # def self.is_wishlist?
    #     where(is_wishlist?: true)
    # end
end
