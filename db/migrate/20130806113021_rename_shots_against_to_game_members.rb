class RenameShotsAgainstToGameMembers < ActiveRecord::Migration
  def change
    rename_column :game_members, :shots_against, :shot_on_goal
  end
end
