class CafeRestaurant < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :user , through: :user_roles
    validates :name, presence: true
    validates :website, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i,
    message: "Invalid URL format" }
    scope :search_name_cafe, ->(name) { where("name ILIKE ?" , "%#{name}%")}
end
