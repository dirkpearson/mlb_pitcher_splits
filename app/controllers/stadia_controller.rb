class StadiaController < ApplicationController
  def index
    @stadia = Stadium.all

    render("stadia/index.html.erb")
  end

  def show
    @stadium = Stadium.find(params[:id])

    render("stadia/show.html.erb")
  end

  def new
    @stadium = Stadium.new

    render("stadia/new.html.erb")
  end

  def create
    @stadium = Stadium.new

    @stadium.name = params[:name]
    @stadium.team_id = params[:team_id]

    save_status = @stadium.save

    if save_status == true
      redirect_to("/stadia/#{@stadium.id}", :notice => "Stadium created successfully.")
    else
      render("stadia/new.html.erb")
    end
  end

  def edit
    @stadium = Stadium.find(params[:id])

    render("stadia/edit.html.erb")
  end

  def update
    @stadium = Stadium.find(params[:id])

    @stadium.name = params[:name]
    @stadium.team_id = params[:team_id]

    save_status = @stadium.save

    if save_status == true
      redirect_to("/stadia/#{@stadium.id}", :notice => "Stadium updated successfully.")
    else
      render("stadia/edit.html.erb")
    end
  end

  def destroy
    @stadium = Stadium.find(params[:id])

    @stadium.destroy

    if URI(request.referer).path == "/stadia/#{@stadium.id}"
      redirect_to("/", :notice => "Stadium deleted.")
    else
      redirect_to(:back, :notice => "Stadium deleted.")
    end
  end
end
