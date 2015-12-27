class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		  t.references :todo_list
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
