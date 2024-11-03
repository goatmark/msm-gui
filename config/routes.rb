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
  post("/directors/create", { :controller => "directors", :action => "create" })
  post("/directors/update", { :controller => "directors", :action => "update" })
  post("/directors/delete", { :controller => "directors", :action => "delete" })

  # Movies
  get("/movies", { :controller => "movies", :action => "index" })
  # Movies page
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  # POST Domains
  post("/movies/create", { :controller => "movies", :action => "create" })
  post("/movies/update", { :controller => "movies", :action => "update" })
  post("/movies/delete", { :controller => "movies", :action => "delete" })

  # Actors
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })

  # POST Domains
  post("/actors/create", { :controller => "actors", :action => "create" })
  post("/actors/update", { :controller => "actors", :action => "update" })
  post("/actors/delete", { :controller => "actors", :action => "delete" })
end
