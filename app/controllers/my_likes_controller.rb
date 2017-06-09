class MyLikesController < ApplicationController
  def index

  @likes = Like.includes(:pitcher).where(user_id: current_user.id)


  render("my_likes/index.html.erb")
end
def show

  @like = Like.select("likes.*,pitchers.pitcher_name as pitcher_name, teams.code as team_code").joins("INNER JOIN pitchers ON likes.pitcher_id=pitchers.id INNER JOIN teams ON pitchers.team_id=teams.id").where(id: params[:id]).first


  render("my_likes/show.html.erb")

end
end
