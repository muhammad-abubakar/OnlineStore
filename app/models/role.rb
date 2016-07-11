class Role < ActiveRecord::Base
  has_many :users

  ADMIN    = "Admin"
  USER     = "User"
  GUEST    = "Guest"
end
