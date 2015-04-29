class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members, :id => false do |t|
      t.references :team, :null => false
      t.references :member, :null => false

      t.timestamps
    end
  end
end
