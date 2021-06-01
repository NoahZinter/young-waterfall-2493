require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
    it {should have_many(:actor_movies).through(:movies)}
    it {should have_many(:actors).through(:actor_movies)}
  end
end
