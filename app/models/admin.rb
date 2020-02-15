class Admin < ApplicationRecord
	has_secure_password
	has_many :tasks
	has_many :nags
	has_many :groups
	has_many :users

	validates :name, :email, presence: true

	def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |admin|
      admin.name = auth.info.name
      admin.email = auth.info.email
      admin.password = SecureRandom.hex
    end
  end

	
end
# class User/Admin < ActiveRecord::Base
#   has_many :tasks
#   has_many :nags, :through => :tasks
# end


# class User/Admin < ActiveRecord::Base
#   has_many :tasks
#   has_many :groups, :through => :tasks
# end