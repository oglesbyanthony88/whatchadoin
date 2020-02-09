class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
