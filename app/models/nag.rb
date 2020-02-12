class Nag < ApplicationRecord
	belongs_to :admin, optional:true
	belongs_to :user, optional:true
	belongs_to :task
end
