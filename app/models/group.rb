class Group < ApplicationRecord
	has_many :users, through: :tasks
	belongs_to :admin, class_name: "User"
end
