require 'rails_helper'

describe 'movie show' do
  before :each do
    @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    @avengers = @marvel.movies.create!(title:'Avengers', creation_year: 1990, genre:'Action')
    @wolverine = @marvel.movies.create!(title:'Wolverine', creation_year: 1998, genre:'Drama')
    @ford = Actor.create!(name: 'Harrison Ford', age: 40, working: true, movie_id: @avengers.id)
    @ferrell = Actor.create!(name: 'Will Ferrell', age: 50, working: true, movie_id: @avengers.id )
    @johanssen = Actor.create!(name: 'Scarlett Johanssen', age: 30, working: true, movie_id: @avengers.id)
    @roberts = Actor.create!(name: 'Dread Pirate Roberts', age: 30, working: true, movie_id: @wolverine.id)
    visit "/movies/#{@avengers.id}"
  end
  it 'displays movie title year and genre' do
    expect(page).to have_content('Movie title: Avengers')
    expect(page).to have_content('Movie creation year: 1990')
    expect(page).to have_content('Movie genre: Action')
  end
  it 'displays all actors in a movie' do
    expect(page).to have_content('Harrison Ford')
    expect(page).to have_content('Will Ferrell')
    expect(page).to have_content('Scarlett Johanssen')
  end
  it 'contains a form to add an actor' do
    expect(page).to have_field('Add Actor')
  end
  it 'adds actors' do
    fill_in 'Add Actor', :with => 'Dread Pirate Roberts'
    click_button('Submit')

    expect(current_path).to eq "/movies/#{@avengers.id}"
    expect(page).to have_content('Dread Pirate Roberts')
  end
end