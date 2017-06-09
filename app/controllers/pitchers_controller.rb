class PitchersController < ApplicationController

    def index
        @q = Pitcher.ransack(params[:q])
        @pitchers = @q.result

      #render("pitchers/index.html.erb")
      render :index
    end

    def show
      @pitcher = Pitcher.find(params[:id])

      @pitcher_batters = PitcherBatter.select("pitcher_batters.*,batters.batter_name AS batter_name").joins("INNER JOIN batters on pitcher_batters.batter_id=batters.id").where(pitcher_id: params[:id])

render("pitchers/show.html.erb")
    end

    def new
      @pitcher = Pitcher.new

      render("pitchers/new.html.erb")
    end

    def create
      @pitcher = Pitcher.new

      @pitcher.team_id = params[:team_id]
      @pitcher.throws_id = params[:throws_id]
      @pitcher.first_name = params[:first_name]
      @pitcher.last_name = params[:last_name]
      @pitcher.pitcher_name = params[:pitcher_name]

      save_status = @pitcher.save

      if save_status == true
        redirect_to("/pitchers/#{@pitcher.id}", :notice => "Pitcher created successfully.")
      else
        render("pitchers/new.html.erb")
      end
    end

    def edit
      @pitcher = Pitcher.find(params[:id])

      render("pitchers/edit.html.erb")
    end

    def update
      @pitcher = Pitcher.find(params[:id])

      @pitcher.team_id = params[:team_id]
      @pitcher.throws_id = params[:throws_id]
      @pitcher.first_name = params[:first_name]
      @pitcher.last_name = params[:last_name]
      @pitcher.pitcher_name = params[:pitcher_name]

      save_status = @pitcher.save

      if save_status == true
        redirect_to("/pitchers/#{@pitcher.id}", :notice => "Pitcher updated successfully.")
      else
        render("pitchers/edit.html.erb")
      end
    end

    def destroy
      @pitcher = Pitcher.find(params[:id])

      @pitcher.destroy

      if URI(request.referer).path == "/pitchers/#{@pitcher.id}"
        redirect_to("/", :notice => "Pitcher deleted.")
      else
        redirect_to(:back, :notice => "Pitcher deleted.")
      end
    end

end
