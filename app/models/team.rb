class Team < ActiveRecord::Base
  belongs_to :prefecture
  attr_accessible :home_place, :image_url, :since, :team_name, :prefecture_id
end
