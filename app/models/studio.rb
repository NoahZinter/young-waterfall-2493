class Studio < ApplicationRecord
  has_many :movies
  has_many :actor_movies, through: :movies
  has_many :actors, through: :actor_movies
end
