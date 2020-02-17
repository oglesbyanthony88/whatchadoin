class Nag < ApplicationRecord
	belongs_to :admin, optional: true
	belongs_to :user, optional: true
	
	# delegate :admin, :to => :task, :allow_nil => true
	# delegate :user, :to => :task, :allow_nil => true
	validates :content, length: {in: 1..100}

	scope :date_reversed, -> { order('created_at DESC') }

	def creator
		!!admin_id ? admin : user
	end
	
end



