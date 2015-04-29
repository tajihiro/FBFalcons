class SeasonTeam < ActiveRecord::Base
  belongs_to :season
  belongs_to :division
  belongs_to :team
  # attr_accessible :title, :body
end
