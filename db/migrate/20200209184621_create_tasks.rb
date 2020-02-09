class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :content
      t.datetime :duedate
      t.belongs_to :admin, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :taskfeed, foreign_key: true

      t.timestamps
    end
  end
end
