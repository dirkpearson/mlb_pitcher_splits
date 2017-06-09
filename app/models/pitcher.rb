class Pitcher < ApplicationRecord

  has_many :pitcher_batters

  has_many :likes

  has_many :fans, :through => :likes, :source => :user
  belongs_to :team
end
