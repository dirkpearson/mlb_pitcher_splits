Rails.application.routes.draw do
  devise_for :users
  # Routes for the Pitcher_batter resource:

  get "/", :controller => "pitcher_batters", :action => "index"

  # READ

  get "/pitcher_batters", :controller => "pitcher_batters", :action => "index"
  get "/pitcher_batters/:id", :controller => "pitcher_batters", :action => "show"


  #------------------------------

  # Routes for the Batter resource:


  # READ
  get "/batters", :controller => "batters", :action => "index"
  get "/batters/:id", :controller => "batters", :action => "show"


  #------------------------------

  #------------------------------

  # Routes for the Pitcher resource:


  # READ
  # root "pitchers#index"
  get "/pitchers", :controller => "pitchers", :action => "index"
  get "/pitchers/:id", :controller => "pitchers", :action => "show"


  get "/my_likes", :controller => "my_likes", :action => "show"
  get "/my_likes/:id", :controller => "my_likes", :action => "show"


get "/users/:id/edit", :controller => "users", :action => "edit"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
