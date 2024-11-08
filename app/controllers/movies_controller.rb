class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
  
  def create
    
    # Create new director row
    m = Movie.new

    # Retrieve inputs
    m.title = params.fetch("query_title","")
    m.year = params.fetch("query_year","")
    m.duration = params.fetch("query_duration","")
    m.description = params.fetch("query_description","")
    m.image = params.fetch("query_image","")
    m.director_id = params.fetch("query_director_id","")

    # Push to database
    m.save

    # Redirect
    redirect_to("/movies")
  end

  def update
    
    @movie_id = params.fetch("path_id","").to_i

    # Read director row
    m = Movie.all.where({:id => @movie_id}).at(0)

    # Retrieve inputs
    m.title = params.fetch("query_title","")
    m.year = params.fetch("query_year","")
    m.duration = params.fetch("query_duration","")
    m.description = params.fetch("query_description","")
    m.image = params.fetch("query_image","")
    m.director_id = params.fetch("query_director_id","")

    # Push to database
    m.save

    # Redirect
    redirect_to("/movies/" + @movie_id.to_s)
  end

  def delete
    
    @movie_id = params.fetch("movie_id","").to_i

    # Read director row
    m = Movie.all.where({:id => @movie_id}).at(0)

    # Push to database
    m.destroy

    # Redirect
    redirect_to("/movies")
  end
end
