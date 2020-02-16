class Group < ApplicationRecord
	has_many :tasks
	has_many :users, through: :tasks
	has_many :nags, through: :tasks 
	belongs_to :admin

	delegate :users, :to => :tasks, :allow_nil => true
	
	scope :group_alpha, -> { order(:title) }

	validates :title, presence: :true

end


# class Groups < ActiveRecord::Base
#   belongs_to :tasks

#   delegate :user/admin, :to => :tasks, :allow_nil => true
# end