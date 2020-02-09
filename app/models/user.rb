class User < ApplicationRecord
	has_secure_password
  has_many :nags
  has_many :tasks
end
