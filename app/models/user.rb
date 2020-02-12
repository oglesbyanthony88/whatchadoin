class User < ApplicationRecord
	has_secure_password #Validates secure password
	has_many :tasks
	has_many :nags
	has_many :groups, through: :tasks
	belongs_to :admin

	validates :name, :email, presence: true

	
end