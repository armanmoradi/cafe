class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save { self.email = email.downcase}
    has_many :user_roles, dependent: :destroy
    has_many :cafe_restaurants , through: :user_roles
    validates :name, presence: true,
                    uniqueness: { case_sensitive: false },
                   length: {minimum: 2, maximum: 35}

    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: {maximum: 100},
                        format: { with: VALID_EMAIL_REGEX }

    validates_inclusion_of :age, :in=>Date.new(1900)..Time.now.years_ago(18).to_date
    
    scope :search_user_name, ->(name) { where("name ILIKE ?", "%#{name}%")}
end
