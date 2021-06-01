class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
  end

  def update
    @movie = Movie.find(params[:id])
    new_actor = Actor.find_by_name(params[:actor])
    @movie.actors.create(name: new_actor.name, age: new_actor.age, working: new_actor.working, movie_id: @movie.id)
    @actors = @movie.actors
    redirect_to "movies/#{@movie.id}"
  end
end