class Task < ApplicationRecord
	belongs_to :admin
	belongs_to :user
	has_many :groups
	has_many :nags

	validates :content, length: {in: 1..100}

	scope :order_by_due_date, -> { order('duedate ASC') }
	
end
