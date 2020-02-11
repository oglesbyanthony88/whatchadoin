class Admin < ApplicationRecord
	has_secure_password
	has_many :groups
	has_many :tasks
	has_many :nags
	has_many :users
end
