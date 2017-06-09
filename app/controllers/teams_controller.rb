class TeamsController < ApplicationController
  def index
    @teams = Team.all

    render("teams/index.html.erb")
  end

  def show
    @team = Team.find(params[:id])

    render("teams/show.html.erb")
  end

  def new
    @team = Team.new

    render("teams/new.html.erb")
  end

  def create
    @team = Team.new

    @team.stadium_id = params[:stadium_id]

    save_status = @team.save

    if save_status == true
      redirect_to("/teams/#{@team.id}", :notice => "Team created successfully.")
    else
      render("teams/new.html.erb")
    end
  end

  def edit
    @team = Team.find(params[:id])

    render("teams/edit.html.erb")
  end

  def update
    @team = Team.find(params[:id])

    @team.stadium_id = params[:stadium_id]

    save_status = @team.save

    if save_status == true
      redirect_to("/teams/#{@team.id}", :notice => "Team updated successfully.")
    else
      render("teams/edit.html.erb")
    end
  end

  def destroy
    @team = Team.find(params[:id])

    @team.destroy

    if URI(request.referer).path == "/teams/#{@team.id}"
      redirect_to("/", :notice => "Team deleted.")
    else
      redirect_to(:back, :notice => "Team deleted.")
    end
  end
end
