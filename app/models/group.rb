class Group < ApplicationRecord
	has_many :users, through: :tasks
	has_many :tasks, dependent: :destroy
	belongs_to :admin

	validates :title, presence: :true

end
