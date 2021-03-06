class Group < ApplicationRecord
	has_many :tasks
	has_many :users, through: :tasks
	has_many :nags, through: :tasks 
	belongs_to :admin


	
	scope :group_alpha, -> { order(:title) }

	def self.user_groups
		joins(:users).group(:group_id).order(:title)
	end

	validates :title, presence: :true

end

# Group.joins(:users).group('users.id = 4').order(:title)