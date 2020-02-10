class User < ApplicationRecord
	has_secure_password
	has_many :tasks
	has_many :nags
	has_many :groups, through: :tasks
	has_many :admin_groups, foreign_key: "admin_id", class_name: "Group"
end