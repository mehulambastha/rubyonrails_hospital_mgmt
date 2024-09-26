class UserRole < ApplicationRecord
  has_many :users
  belongs_to :permission
end
