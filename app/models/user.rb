class User < ApplicationRecord
    has_secure_password
    has_many :adventures, dependent: :destroy
    has_many :locations, through: :adventures

    validates :username, :email, presence: true, unless: :auth_id
    validates :username, :email, uniqueness: true, unless: :auth_id

    # def self.oauth_login(auth)
    #     user = User.find_or_create_by(auth_id: auth.uid) do |u|
    #       u.auth_id = auth.uid
    #       u.username = auth.info.name
    #       u.password = auth['uid']   # SecureRandom.hex
    #     end
    # end

end
