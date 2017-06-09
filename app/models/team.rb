class Team < ApplicationRecord

has_many :pitchers, :dependent => :nullify
has_one :stadium
has_many :batters

end
