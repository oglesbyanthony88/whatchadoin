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
