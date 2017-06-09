class Stadium < ApplicationRecord
  self.table_name = "stadiums"

  belongs_to :team
end
