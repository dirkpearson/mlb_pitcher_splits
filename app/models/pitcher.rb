class Pitcher < ApplicationRecord

  has_many :pitcher_batters
  belongs_to :team

end
