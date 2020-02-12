class Nag < ApplicationRecord
	belongs_to :admin, optional:true
	belongs_to :user
	belongs_to :task
end
