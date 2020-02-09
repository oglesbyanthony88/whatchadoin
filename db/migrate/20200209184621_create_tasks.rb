class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :duedate
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
