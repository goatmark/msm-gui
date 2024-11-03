class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def insert
    
    # Create new director row
    a = Actor.new

    # Retrieve inputs
    a.name = params.fetch("query_name","")
    a.dob = params.fetch("query_dob","")
    a.bio = params.fetch("query_bio","")
    a.image = params.fetch("query_image","")

    # Push to database
    a.save

    # Redirect
    redirect_to("/actors")
  end
end
