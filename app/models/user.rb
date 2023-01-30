class User < ApplicationRecord
    before_save { self.email = email.downcase}
    has_many :user_roles, dependent: :destroy
    has_many :cafe_restaurants , through: :user_roles
    validates :name, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: {maximum: 70},
                        format: { with: VALID_EMAIL_REGEX }
    scope :search_user_name, ->(name) { where("name ILIKE ?", "%#{name}%")}
end
