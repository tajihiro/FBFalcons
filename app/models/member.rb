class Member < ActiveRecord::Base
  
  #Association with Position  
  belongs_to :position
  
  #Association with Game  
  has_many :game_members
  has_many :games, :through => :game_members
  
  
  attr_accessible :address, :birth_place, :birthday, :first_en_name, :first_name, :gender, :image_url, 
                  :jersey_number, :last_en_name, :last_name, :nick_name, :position_id
end
