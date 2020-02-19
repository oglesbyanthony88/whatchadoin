Admin.create([{name: 'daffy', email:'daffy@gmail.com', password: 'daffy1'},
						 {name: 'prince', email:'prince@gmail.com', password: 'prince1'},
						 {name: 'harry', email:'harry@gmail.com', password: 'harry1'}])

User.create([{name: 'sandy', email:'sandy@gmail.com', password: 'sandy1', admin_id: 1},
						{name: 'carl', email:'carl@gmail.com', password: 'carl1', admin_id: 1},
						{name: 'chelsea', email:'chelsea@gmail.com', password: 'chelsea1', admin_id: 1},
						{name: 'monica', email:'monica@gmail.com', password: 'monica1', admin_id: 2},
						{name: 'lauren', email:'lauren@gmail.com', password: 'lauren1', admin_id: 2},
						{name: 'peter', email:'peter@gmail.com', password: 'peter1', admin_id: 2},
						{name: 'trevor', email:'trevor@gmail.com', password: 'trevor1', admin_id: 3},
						{name: 'paul', email:'paul@gmail.com', password: 'paul1', admin_id: 3},
						{name: 'poppy', email:'poppy@gmail.com', password: 'poppy1', admin_id: 3}])

Group.create([{title: "test group 1", admin_id: 2},
							{title: "test group 2", admin_id: 2}])

Task.create([{content: "test task 1", admin_id: 2, user_id: 3, group_id: 1},
						{content: "test task 2", admin_id: 2, user_id: 4, group_id: 2},
						{content: "test task 3", admin_id: 2, user_id: 5, group_id: 1},
						{content: "test task 4", admin_id: 2, user_id: 3, group_id: 2}])

Nag.create([{content: "test nag 1", admin_id:2, user_id: nil, task_id: 1},
						{content: "test nag 2", admin_id:2, user_id: nil, task_id: 2},
						{content: "test nag 3", admin_id:2, user_id: nil, task_id: 3},
						{content: "test nag 4", admin_id:nil, user_id: 3, task_id: 4},
						{content: "test nag 5", admin_id:nil, user_id: 3, task_id: 1},
						{content: "test nag 6", admin_id:nil, user_id: 3, task_id: 2},
						{content: "test nag 7", admin_id:nil, user_id: 4, task_id: 3},
						{content: "test nag 8", admin_id:nil, user_id: 4, task_id: 4},
						{content: "test nag 9", admin_id:nil, user_id: 4, task_id: 1},
						{content: "test nag 10", admin_id:nil, user_id: 5, task_id: 2},
						{content: "test nag 11", admin_id:nil, user_id: 5, task_id: 3},
						{content: "test nag 12", admin_id:nil, user_id: 5, task_id: 4}])