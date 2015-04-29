class Game < ActiveRecord::Base
  
  #Association with Season  
  belongs_to :season
  
  #Association with Division
  belongs_to :division
  
  #Association with Team
  belongs_to :team
  belongs_to :home_team, :class_name => "Team", :foreign_key => "home_team_id"
  belongs_to :away_team, :class_name => "Team", :foreign_key => "away_team_id"

  #Association with GameMembers
  has_many :game_members
  has_many :members, :through => :game_members
  
  attr_accessible :away_team_id, :away_team_score, :comments, :game_date, :game_place, :game_time, 
                  :home_team_id, :home_team_score, :movie_url, :team_id, :division_id,
                  :game_name, :season_id

  #
  # 入力検証処理
  #
  #validates :game_name, :presence => {:message => 'は必須です。'}
                  
end
