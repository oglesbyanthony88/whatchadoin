class Group < ApplicationRecord
	has_one :admin
	has_many :users
end
