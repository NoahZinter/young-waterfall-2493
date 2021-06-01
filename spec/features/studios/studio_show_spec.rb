require 'rails_helper'

describe 'studio show' do
  before :each do
    @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    @avengers = @marvel.movies.create!(title:'Avengers', creation_year: 1990, genre:'Action')
    @wolverine = @marvel.movies.create!(title:'Wolverine', creation_year: 1998, genre:'Drama')
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
end