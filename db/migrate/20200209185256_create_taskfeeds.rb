class CreateTaskfeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :taskfeeds do |t|
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
