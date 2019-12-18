class User < ApplicationRecord
    has_secure_password
    has_many :adventures, dependent: :destroy
    has_many :locations, through: :adventures

    validates :username, :email, presence: true, unless: :auth_id
    validates :username, :email, uniqueness: true, unless: :auth_id

end
