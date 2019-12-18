class Adventure < ApplicationRecord
    belongs_to :user
    belongs_to :location
    # belongs_to :category 

    # accepts_nested_attributes_for :location
    def location_attributes=(attributes)
        location = Location.find_or_create_by(attributes)
        self.location = location #if location.valid? 
    end

    #ActiveRecord Scope
    default_scope { order(created_at: :desc)}
    scope :is_wishlist, -> { where(is_wishlist: true)}
        # def self.is_wishlist
        #     where(is_wishlist: true)
        # end
    scope :adventure_done, -> { where(is_wishlist: false)}

    validates :name, :recommendation, presence: true
    # validates :name, uniqueness: true
    validates :location_id, presence: true
    validates_associated :location
end
