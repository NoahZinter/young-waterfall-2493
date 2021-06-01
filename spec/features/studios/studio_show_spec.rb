require 'rails_helper'

describe 'studio show' do
  before :each do
    @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    visit "/studios/#{@marvel.id}"
  end
  
  it 'displays studio name and location' do
    expect(page).to have_content("Marvel details:")
    expect(page).to have_content("Studio Name: Marvel")
    expect(page).to have_content("Studio Location: Hollywood")
  end
end