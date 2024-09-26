class User < ApplicationRecord
  belongs_to :role
end
has_secure_password
