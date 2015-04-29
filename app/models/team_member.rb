class TeamMember < ActiveRecord::Base
  belongs_to :team
  belongs_to :member
  # attr_accessible :title, :body
end
