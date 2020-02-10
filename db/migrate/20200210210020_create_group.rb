class CreateGroup < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
    	t.string :title
    	t.references :admin

    	t.timestamps
    end
  end
end
