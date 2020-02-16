class Task < ApplicationRecord
	belongs_to :admin
	belongs_to :user
	has_many :groups
	has_many :nags

	validates :content, presence: :true

	scope :order_by_due_date, -> { order('duedate ASC') }
	
end
