class Like < ApplicationRecord

validates :pitcher_id, :uniqueness => {:scope => :user_id, :message => "already bookmarked"}

belongs_to :pitcher
belongs_to :user

end
