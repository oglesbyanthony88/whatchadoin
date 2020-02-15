class Task < ApplicationRecord
	belongs_to :admin
	belongs_to :user
	has_many :groups
	has_many :nags

	validates :content, presence: :true

	# MAKE A JOIN TABLE FOR NAGS AND TASKS
	
end


# class User/Admin < ActiveRecord::Base
#   has_many :tasks
#   has_many :groups, :through => :tasks
# end

# class Tasks < ActiveRescord::Base
#   belongs_to :user/admin
#   has_many :groups
# end

# class Groups < ActiveRecord::Base
#   belongs_to :tasks

#   delegate :user/admin, :to => :tasks, :allow_nil => true
# end

# Company => User Admin
# Employee => Tasks
# Dog => Groups