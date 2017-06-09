Rails.application.routes.draw do
  devise_for :users
  # Routes for the Pitcher_batter resource:

  get "/", :controller => "pitcher_batters", :action => "index"
  # CREATE
  get "/pitcher_batters/new", :controller => "pitcher_batters", :action => "new"
  post "/create_pitcher_batter", :controller => "pitcher_batters", :action => "create"

  # READ

  get "/pitcher_batters", :controller => "pitcher_batters", :action => "index"
  get "/pitcher_batters/:id", :controller => "pitcher_batters", :action => "show"

  # UPDATE
  get "/pitcher_batters/:id/edit", :controller => "pitcher_batters", :action => "edit"
  post "/update_pitcher_batter/:id", :controller => "pitcher_batters", :action => "update"

  # DELETE
  get "/delete_pitcher_batter/:id", :controller => "pitcher_batters", :action => "destroy"
  #------------------------------

  # Routes for the Batter resource:
  # CREATE
  get "/batters/new", :controller => "batters", :action => "new"
  post "/create_batter", :controller => "batters", :action => "create"

  # READ
  get "/batters", :controller => "batters", :action => "index"
  get "/batters/:id", :controller => "batters", :action => "show"

  # UPDATE
  get "/batters/:id/edit", :controller => "batters", :action => "edit"
  post "/update_batter/:id", :controller => "batters", :action => "update"

  # DELETE
  get "/delete_batter/:id", :controller => "batters", :action => "destroy"
  #------------------------------

  # Routes for the Stadium resource:
  # CREATE
  get "/stadia/new", :controller => "stadia", :action => "new"
  post "/create_stadium", :controller => "stadia", :action => "create"

  # READ
  get "/stadia", :controller => "stadia", :action => "index"
  get "/stadia/:id", :controller => "stadia", :action => "show"

  # UPDATE
  get "/stadia/:id/edit", :controller => "stadia", :action => "edit"
  post "/update_stadium/:id", :controller => "stadia", :action => "update"

  # DELETE
  get "/delete_stadium/:id", :controller => "stadia", :action => "destroy"
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get "/teams/new", :controller => "teams", :action => "new"
  post "/create_team", :controller => "teams", :action => "create"

  # READ
  get "/teams", :controller => "teams", :action => "index"
  get "/teams/:id", :controller => "teams", :action => "show"

  # UPDATE
  get "/teams/:id/edit", :controller => "teams", :action => "edit"
  post "/update_team/:id", :controller => "teams", :action => "update"

  # DELETE
  get "/delete_team/:id", :controller => "teams", :action => "destroy"
  #------------------------------

  # Routes for the Pitcher resource:
  # CREATE
  get "/pitchers/new", :controller => "pitchers", :action => "new"
  post "/create_pitcher", :controller => "pitchers", :action => "create"

  # READ
  # root "pitchers#index"
  get "/pitchers", :controller => "pitchers", :action => "index"
  get "/pitchers/:id", :controller => "pitchers", :action => "show"

  # UPDATE
  get "/pitchers/:id/edit", :controller => "pitchers", :action => "edit"
  post "/update_pitcher/:id", :controller => "pitchers", :action => "update"

  # DELETE
  get "/delete_pitcher/:id", :controller => "pitchers", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
