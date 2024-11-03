Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  # Directors
  # Youngest-eldest
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  # Directors page
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  # POST Domains
  post("/create_director", { :controller => "directors", :action => "create" })
  post("/update_director", { :controller => "directors", :action => "update" })
  post("/delete_director", { :controller => "directors", :action => "delete" })

  # Movies
  get("/movies", { :controller => "movies", :action => "index" })
  # Movies page
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  # POST Domains
  post("/create_movie", { :controller => "movies", :action => "create" })
  post("/update_movie", { :controller => "movies", :action => "update" })
  post("/delete_movie", { :controller => "movies", :action => "delete" })

  # Actors
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  
  # POST Domains
  post("/create_actor", { :controller => "actors", :action => "create" })
  post("/update_actor", { :controller => "actors", :action => "update" })
  post("/delete_actor", { :controller => "actors", :action => "delete" })
end
