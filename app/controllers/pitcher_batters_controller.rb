class PitcherBattersController < ApplicationController

  def index

    @b = PitcherBatter.ransack(params[:q])
    @pitcher_batters = @b.result(:distinct => true).includes(:pitcher,:batter)
    #@b = PitcherBatter.ransack(params[:b])
=begin
    q = nil
    if !params[:q].nil?
      q=params[:q][:pitchers_pitcher_name_cont].strip
    end
    puts "q=#{q} b=#{params[:b]}"
    if q.nil?
    @pitcher_batters = PitcherBatter.select("pitcher_batters.*,pitchers.pitcher_name as pitcher_name,batters.batter_name as batter_name").joins("INNER JOIN pitchers ON pitcher_batters.pitcher_id=pitchers.id INNER JOIN batters on pitcher_batters.batter_id=batters.id")
  else
    @pitcher_batters = PitcherBatter.select("pitcher_batters.*,pitchers.pitcher_name as pitcher_name,batters.batter_name as batter_name").joins("INNER JOIN pitchers ON pitcher_batters.pitcher_id=pitchers.id INNER JOIN batters on pitcher_batters.batter_id=batters.id").where("LOWER(pitchers.pitcher_name) like '%#{q}%'")
  end
=end
logger.debug "pitcher_batters=#{@pitcher_batters.inspect}"

    @batter_teams=[]
    team_hash={}
    @pitcher_batters.collect do |item|
      if team_hash[item.team_code].nil?
        team_hash[item.team_code] = 1
        item.team_code.upcase!
        @batter_teams.push(item)

      end
    end

    #@batter_teams = @pitcher_batters.select(:team_code).uniq
logger.debug "batter_teams=#{@bater_teams.inspect}"
    render :index
  end

  def show
    @pitcher_batter = PitcherBatter.find(params[:id])

    render("pitcher_batters/show.html.erb")
  end

  def new
    @pitcher_batter = PitcherBatter.new

    render("pitcher_batters/new.html.erb")
  end

  def create
    @pitcher_batter = PitcherBatter.new

    @pitcher_batter.pitcher_id = params[:pitcher_id]
    @pitcher_batter.batter_id = params[:batter_id]
    @pitcher_batter.np = params[:np]
    @pitcher_batter.pa = params[:pa]
    @pitcher_batter.ab = params[:ab]
    @pitcher_batter.hits = params[:hits]
    @pitcher_batter.double = params[:double]
    @pitcher_batter.triple = params[:triple]
    @pitcher_batter.hr = params[:hr]
    @pitcher_batter.avg = params[:avg]
    @pitcher_batter.obp = params[:obp]
    @pitcher_batter.slg = params[:slg]
    @pitcher_batter.ops = params[:ops]
    @pitcher_batter.woba = params[:woba]

    save_status = @pitcher_batter.save

    if save_status == true
      redirect_to("/pitcher_batters/#{@pitcher_batter.id}", :notice => "Pitcher batter created successfully.")
    else
      render("pitcher_batters/new.html.erb")
    end
  end

  def edit
    @pitcher_batter = PitcherBatter.find(params[:id])

    render("pitcher_batters/edit.html.erb")
  end

  def update
    @pitcher_batter = PitcherBatter.find(params[:id])

    @pitcher_batter.pitcher_id = params[:pitcher_id]
    @pitcher_batter.batter_id = params[:batter_id]
    @pitcher_batter.np = params[:np]
    @pitcher_batter.pa = params[:pa]
    @pitcher_batter.ab = params[:ab]
    @pitcher_batter.hits = params[:hits]
    @pitcher_batter.double = params[:double]
    @pitcher_batter.triple = params[:triple]
    @pitcher_batter.hr = params[:hr]
    @pitcher_batter.avg = params[:avg]
    @pitcher_batter.obp = params[:obp]
    @pitcher_batter.slg = params[:slg]
    @pitcher_batter.ops = params[:ops]
    @pitcher_batter.woba = params[:woba]

    save_status = @pitcher_batter.save

    if save_status == true
      redirect_to("/pitcher_batters/#{@pitcher_batter.id}", :notice => "Pitcher batter updated successfully.")
    else
      render("pitcher_batters/edit.html.erb")
    end
  end

  def destroy
    @pitcher_batter = PitcherBatter.find(params[:id])

    @pitcher_batter.destroy

    if URI(request.referer).path == "/pitcher_batters/#{@pitcher_batter.id}"
      redirect_to("/", :notice => "Pitcher batter deleted.")
    else
      redirect_to(:back, :notice => "Pitcher batter deleted.")
    end
  end
end
