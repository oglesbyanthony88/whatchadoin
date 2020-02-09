Whatcha doin app

Will prompt a user to input a string describing what they are working on currently.

Models:

Admin
	admin_id (can this be used as a user_id as well?)
	name
	email
	password
belongs_to :group

User
	user_id
	name
	email
	password
belongs_to :group
has_many :nags
has_many :tasks
has_many :nags, through: :feed

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

NagFeed
	group_id
	group_name
	nag_ids (multiple)
		nags_user_name
		nags_content
		nags_published_at
has_many :nags, through: :users
belongs_to :group

TaskFeed
	group_id
	group_name
	task_ids (multiple)
		tasks_user_name
		tasks_content
		tasks_due_date
has_many :tasks, through admin
belongs_to :group



