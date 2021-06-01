require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
    it {should have_many(:actor_movies).through(:movies)}
    it {should have_many(:actors).through(:actor_movies)}
  end
  describe 'instance methods' do
    before :each do
      @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
      @avengers = @marvel.movies.create!(title:'Avengers', creation_year: 1990, genre:'Action')
      @wolverine = @marvel.movies.create!(title:'Wolverine', creation_year: 1990, genre:'Action')
      @ford = Actor.create!(name: 'Harrison Ford', age: 40, working: true, movie_id: @avengers.id)
      @ferrell = Actor.create!(name: 'Will Ferrell', age: 50, working: true, movie_id: @wolverine.id )
      @johanssen = Actor.create!(name: 'Scarlett Johanssen', age: 30, working: false, movie_id: @avengers.id)
      @join_1 = ActorMovie.create!(actor_id: @ford.id, movie_id: @avengers.id)
      @join_1 = ActorMovie.create!(actor_id: @ford.id, movie_id: @wolverine.id)
      @join_2 = ActorMovie.create!(actor_id: @ferrell.id, movie_id: @wolverine.id)
      @join_3 = ActorMovie.create!(actor_id: @johanssen.id, movie_id: @avengers.id)
    end
    describe 'working_actors' do
      it 'lists working actors by age' do
        
        expect(@marvel.working_actors).to eq([@ferrell, @ford])
      end
    end
  end
end
