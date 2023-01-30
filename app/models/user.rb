class User < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :cafe_restaurants , through: :user_roles
    validates :name, presence: true
    scope :search_user_name, ->(name) { where("name ILIKE ?", "%#{name}%")}
end
