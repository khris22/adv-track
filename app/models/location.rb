class Location < ApplicationRecord
    has_many :adventures
    has_many :users, through: :adventures

    # accepts_nested_attributes_for :adventures

    validates :city, :state, presence: true
    # validates :state, uniqueness: true
end
