require 'rails_helper'

describe 'studio show' do
  before :each do
    @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    @avengers = @marvel.movies.create!(title:'Avengers', creation_year: 1990, genre:'Action')
    @wolverine = @marvel.movies.create!(title:'Wolverine', creation_year: 1998, genre:'Drama')
    @ford = Actor.create!(name: 'Harrison Ford', age: 40, working: true, movie_id: @avengers.id)
    @ferrell = Actor.create!(name: 'Will Ferrell', age: 50, working: true, movie_id: @wolverine.id )
    @johanssen = Actor.create!(name: 'Scarlett Johanssen', age: 30, working: false, movie_id: @avengers.id)
    @join_1 = ActorMovie.create!(actor_id: @ford.id, movie_id: @avengers.id)
    @join_1 = ActorMovie.create!(actor_id: @ford.id, movie_id: @wolverine.id)
    @join_2 = ActorMovie.create!(actor_id: @ferrell.id, movie_id: @wolverine.id)
    @join_3 = ActorMovie.create!(actor_id: @johanssen.id, movie_id: @avengers.id)
    visit "/studios/#{@marvel.id}"
  end
  
  it 'displays studio name and location' do
    expect(page).to have_content("Marvel details:")
    expect(page).to have_content("Studio Name: Marvel")
    expect(page).to have_content("Studio Location: Hollywood")
  end

  it 'displays names of all movies for studio' do
    expect(page).to have_content('Avengers')
    expect(page).to have_content('Wolverine')
  end

  it 'displays all working actors for a studio' do
    expect(page).to have_content('Will Ferrell')
    expect(page).to have_content('Harrison Ford')
  end
end