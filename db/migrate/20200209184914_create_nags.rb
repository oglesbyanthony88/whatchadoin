class CreateNags < ActiveRecord::Migration[5.2]
  def change
    create_table :nags do |t|
      t.text :content
      t.datetime :published_at
      t.belongs_to :user, foreign_key: true
      t.belongs_to :admin, optional: true
      t.belongs_to :task, foreign_key: true

      t.timestamps
    end
  end
end
