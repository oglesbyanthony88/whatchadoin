class User < ApplicationRecord
	has_secure_password
	has_many :tasks
	has_many :nags
	has_many :groups, through: :tasks
	belongs_to :admin
end