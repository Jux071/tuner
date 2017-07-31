class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :username, unique: true, null: false
	    t.string :email, unique: true, null: false
	    t.string :password_digest, null: false
	    t.string :remember_digest, null: false
	    t.integer :role, default: 0
	    t.timestamps
    end
  end
end
