class CreateJoinTableUsersCovenants < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :users, :covenants do |t|
	  	t.index :user_id
	  	t.index :covenant_id
		end
  end
end
