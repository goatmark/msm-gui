class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.all.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def create
    
    # Create new director row
    d = Director.new

    # Retrieve inputs
    d.name = params.fetch("query_name","")
    d.dob = params.fetch("query_dob","")
    d.bio = params.fetch("query_bio","")
    d.image = params.fetch("query_image","")

    # Push to database
    d.save

    # Redirect
    redirect_to("/directors")
  end

  def update

    @director_id = params.fetch("path_id","").to_i

    # Read director row
    @d = Director.all.where({:id => @director_id}).at(0)

    # Retrieve inputs
    @d.name = params.fetch("query_name","")
    @d.dob = params.fetch("query_dob","")
    @d.bio = params.fetch("query_bio","")
    @d.image = params.fetch("query_image","")

    # Push to database
    @d.save

    # Redirect
    redirect_to("/directors/" + @d.id.to_s)
  end

  def delete
    
    @director_id = params.fetch("path_id","").to_i

    # Read director row
    @d = Director.all.where({:id => @director_id})

    # Push to database
    @d.delete

    # Redirect
    redirect_to("/directors")
  end

end
