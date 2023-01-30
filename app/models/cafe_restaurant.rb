class CafeRestaurant < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :user , through: :user_roles
    validates :name, presence: true
    scope :search_name_cafe, ->(name) { where("name ILIKE ?" , "%#{name}%")}
end
