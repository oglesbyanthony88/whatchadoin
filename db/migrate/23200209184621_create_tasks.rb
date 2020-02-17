class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :duedate
      t.references :admin
      t.references :user
      t.references :group
      

      

      t.timestamps
    end
  end
end
