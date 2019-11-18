class User < ApplicationRecord
    has_secure_password
    has_many :portfolios
    has_many :historys
    validates :username, presence: true, length: {minimum: 5}
    validates :password, presence: true, length: {minimum: 6}
end
