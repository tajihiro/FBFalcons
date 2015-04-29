class GameMember < ActiveRecord::Base
  belongs_to :game
  belongs_to :member
  
  #attr_accessible :assistrails, :generatep_flg, :genernalties, :goal, :goalie_flg, :shot_on_goal
end
