class PitcherBatter < ApplicationRecord

#  has_many(:pitchers, :class_name => "Pitcher", :foreign_key => "id")
#  has_many(:batters, :class_name => "Batter", :foreign_key => "id")
   belongs_to :pitcher
   belongs_to :batter
end
