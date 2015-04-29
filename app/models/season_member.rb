class SeasonMember < ActiveRecord::Base
  belongs_to :season
  belongs_to :division
  belongs_to :member
  # attr_accessible :title, :body
end
