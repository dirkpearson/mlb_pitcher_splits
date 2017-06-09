class BattersController < ApplicationController
  def index
    @q = Batter.ransack(params[:q])
    @batters = @q.result


    render("batters/index.html.erb")
  end

  def show
    @batter = Batter.find(params[:id])
  @pitcher_batters = PitcherBatter.select("pitcher_batters.*,pitchers.pitcher_name AS pitcher_name,teams.code AS team_code").joins("INNER JOIN pitchers on pitcher_batters.pitcher_id=pitchers.id INNER JOIN teams ON pitchers.team_id=teams.id").where(batter_id: params[:id])
    render("batters/show.html.erb")
  end

  def new
    @batter = Batter.new

    render("batters/new.html.erb")
  end

  def create
    @batter = Batter.new

    @batter.bats_id = params[:bats_id]
    @batter.team_id = params[:team_id]
    @batter.first_name = params[:first_name]
    @batter.last_name = params[:last_name]
    @batter.batter_name = params[:batter_name]

    save_status = @batter.save

    if save_status == true
      redirect_to("/batters/#{@batter.id}", :notice => "Batter created successfully.")
    else
      render("batters/new.html.erb")
    end
  end

  def edit
    @batter = Batter.find(params[:id])

    render("batters/edit.html.erb")
  end

  def update
    @batter = Batter.find(params[:id])

    @batter.bats_id = params[:bats_id]
    @batter.team_id = params[:team_id]
    @batter.first_name = params[:first_name]
    @batter.last_name = params[:last_name]
    @batter.batter_name = params[:batter_name]

    save_status = @batter.save

    if save_status == true
      redirect_to("/batters/#{@batter.id}", :notice => "Batter updated successfully.")
    else
      render("batters/edit.html.erb")
    end
  end

  def destroy
    @batter = Batter.find(params[:id])

    @batter.destroy

    if URI(request.referer).path == "/batters/#{@batter.id}"
      redirect_to("/", :notice => "Batter deleted.")
    else
      redirect_to(:back, :notice => "Batter deleted.")
    end
  end
end
