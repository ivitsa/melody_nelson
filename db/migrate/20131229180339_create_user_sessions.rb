class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
    	    t.timestamps
    	    t.string :session_id, :null => false
    	    t.text :data
    end
    add_index :user_sessions, :session_id
    add_index :user_sessions, :updated_at
  end
end
