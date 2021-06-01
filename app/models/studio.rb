class Studio < ApplicationRecord
  has_many :movies
  has_many :actor_movies, through: :movies
  has_many :actors, through: :actor_movies

  def working_actors
    actors = Actor.where(movie_id: movies.ids)
    actors.where("working = ?", true).order(age: :desc).distinct
  end
end
