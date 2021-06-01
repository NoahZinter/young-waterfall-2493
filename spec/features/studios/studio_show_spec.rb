require 'rails_helper'

describe 'studio show' do
  before :each do
    @marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    visit "/studios/#{@marvel.id}"
  end
  
  it 'displays studio name and location' do
    expect(page).to have_content("Marvel details:")
  end
end