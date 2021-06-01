class Actor < ApplicationRecord
  belongs_to :movie
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.find_by_name(name)
    Actor.where("name = ?", name).first
  end
end
