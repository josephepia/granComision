class CreateCommunityGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :community_groups do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
