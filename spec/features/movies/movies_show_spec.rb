require 'rails_helper'

describe 'movie show' do
  before :each do
    @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    @avengers = @marvel.movies.create!(title:'Avengers', creation_year: 1990, genre:'Action')
    @ford = Actor.create!(name: 'Harrison Ford', age: 40, working: true, movie_id: @avengers.id)
    @ferrell = Actor.create!(name: 'Will Ferrell', age: 50, working: true, movie_id: @avengers.id )
    @johanssen = Actor.create!(name: 'Scarlett Johanssen', age: 30, working: true, movie_id: @avengers.id)
    visit "/movies/#{@avengers.id}"
  end
  it 'displays movie title year and genre' do
    expect(page).to have_content('Movie title: Avengers')
    expect(page).to have_content('Movie creation year: 1990')
    expect(page).to have_content('Movie genre: Action')
  end
end