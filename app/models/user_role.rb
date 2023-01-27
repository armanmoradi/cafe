class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :cafe_restaurant
  enum :role_type, { waiter: 0, chef: 1, admin: 2}
end
