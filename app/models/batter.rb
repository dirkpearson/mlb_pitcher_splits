class Batter < ApplicationRecord
  belongs_to :team
  has_many :pitcher_batters
end
