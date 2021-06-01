require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:actor_movies)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'instance methods' do
    describe 'actors' do
      it 'lists the actors for a movie' do
        @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
        @avengers = @marvel.movies.create!(title:'Avengers', creation_year: 1990, genre:'Action')
        @ford = Actor.create!(name: 'Harrison Ford', age: 40, working: true, movie_id: @avengers.id)
        @ferrell = Actor.create!(name: 'Will Ferrell', age: 50, working: true, movie_id: @avengers.id )
        @johanssen = Actor.create!(name: 'Scarlett Johanssen', age: 30, working: true, movie_id: @avengers.id)
        expected = [@ford, @ferrell, @johanssen]
        expect(@avengers.actors.sort).to eq(expected.sort)
      end
    end
  end
end
