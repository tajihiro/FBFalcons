class Season < ActiveRecord::Base

  #Association with Games  
  has_many :games

  
  attr_accessible :season_end, :season_name, :season_start
end
