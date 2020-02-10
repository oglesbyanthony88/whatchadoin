class Task < ApplicationRecord
	belongs_to :admin, class_name: "User"
	belongs_to :user
	belongs_to :group
	has_many :nags, through: :users
end
