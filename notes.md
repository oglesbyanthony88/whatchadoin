Whatcha doin app

Will prompt a user to input a string describing what they are working on currently.

Models:

User
	user_id
	name
	email
	password
	is_admin
has_many :nags
has_many :tasks, through admin

Task
	task_id
	admin_id
	admin.name
	user_id
	user.names
	content
	due_date

belongs_to :admin
belongs_to :users
belongs_to :taskfeed
	
Nag
	nag_id
	user_id
	user.name
	content
	published_at
belongs_to :admin
belongs_to :user
belongs_to :nagfeed

Group
	group_id
	group_name
	admin_id
	admin_name
	user_id (multiple)
	user_names (multiple)

has_one :admin
has_many :users

<!-- class Group < ApplicationRecord
	has_many :users, through: :tasks
	belongs_to :admin, class_name: "User"
end

class User < ApplicationRecord
	has_many :tasks
	has_many :nags
	has_many :groups through: :tasks
	has_many :admin_groups, foriegn_key: "admin_id", class_name: "Group"
end

class Task < ApplicationRecord
	belongs_to :user, source: :admin_id
	belongs_to :user
	belongs_to :group
	has_many :nags, through: :users
end

class Nag < ApplicationRecord
	belongs_to :user
	belongs_to :task
end -->





