class User < ApplicationRecord
    has_many :user_role
    validates :name, presence: true
    scope :search_user_name, ->(name) { where("name ILIKE ?", "%#{name}%")}
    # Ex:- scope :active, -> {where(:active => true)}
end
