class Adventure < ApplicationRecord
    belongs_to :user
    belongs_to :location
    # belongs_to :category 

    # accepts_nested_attributes_for :location

    def location_attributes=(attributes)
        location = Location.find_or_create_by(attributes)
        self.location = location if location.valid?
    end

    # def location_attributes=(attributes)
    #     location = Location.find_or_create_by(city: attributes[:city])
    #     self.location = location
    # end

    # def location_attributes=(attributes)
    #     location = Location.find_or_create_by(id: attributes[:id])
    #      binding.pry
    #     self.location.update(attributes)
    # end

    scope :is_wishlist, -> { where(is_wishlist: true)}
    scope :adventure_done, -> { where(is_wishlist: false)}
    # scope :desc, order(name: :desc)
    default_scope { order(created_at: :desc)}


    # def self.is_wishlist
    #     where(is_wishlist: true)
    # end
    validates :name, :recommendation, presence: true
    validates :name, uniqueness: true
end
