class CreateNags < ActiveRecord::Migration[5.2]
  def change
    create_table :nags do |t|
      t.text :content
      t.datetime :published_at
      t.belongs_to :user, foreign_key: true, optional: true
      t.belongs_to :admin, foreign_key: true, optional: true
      t.references :task

      t.timestamps
    end
  end
end
