class Nagfeed < ApplicationRecord
	has_many :nags, through: :users
	belongs_to :group
end
