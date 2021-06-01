require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should belong_to :movie}
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'class methods' do
    describe 'find by name' do
      it 'finds actor by name' do
        @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
        @avengers = @marvel.movies.create!(title:'Avengers', creation_year: 1990, genre:'Action')
        @ford = Actor.create!(name: 'Harrison Ford', age: 40, working: true, movie_id: @avengers.id)

        expect(Actor.find_by_name('Harrison Ford')).to eq(@ford)
      end
    end
  end
end
