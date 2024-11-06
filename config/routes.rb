Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  # Directors
  # Youngest-eldest
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  # Directors list
  get("/directors", { :controller => "directors", :action => "index" })
  
  # Directors page
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  # POST Domains
  post("/directors/create", { :controller => "directors", :action => "create" })
  post("/directors/update", { :controller => "directors", :action => "update" })
  
  # Delete Page
  get("/delete_director/:director_id", { :controller => "directors", :action => "delete" })
  

  # Movies
  get("/movies", { :controller => "movies", :action => "index" })
  # POST Domains
  post("/movies/create", { :controller => "movies", :action => "create" })
  post("/movies/update", { :controller => "movies", :action => "update" })
  get("/delete_movie/:movie_id", { :controller => "movies", :action => "delete" })
  # Movies page
  get("/movies/:path_id", { :controller => "movies", :action => "show" })

  # Actors
  
  get("/actors", { :controller => "actors", :action => "index" })

  # POST Domains
  post("/actors/create", { :controller => "actors", :action => "create" })
  post("/actors/update", { :controller => "actors", :action => "update" })
  
  get("/delete_actor/:actor_id", { :controller => "actors", :action => "delete" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
