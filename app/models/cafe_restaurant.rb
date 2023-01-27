class CafeRestaurant < ApplicationRecord
    has_many :user_role
    validates :name, presence: true
end
