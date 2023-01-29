class CafeRestaurant < ApplicationRecord
    has_many :user_role
    validates :name, presence: true
    scope :search_name_cafe, ->(name) { where("name ILIKE ?" , "%#{name}%")}
    # Ex:- scope :active, -> {where(:active => true)}
end
