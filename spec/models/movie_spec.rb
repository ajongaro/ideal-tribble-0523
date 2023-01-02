require 'rails_helper'

RSpec.describe Movie do
 let!(:studio1) { Studio.create!(name: "Universal", location: "Hollywood, CA") }

 let!(:movie1) { Movie.create!(title: "Aladdin", creation_year: 2006, genre: "Animated", studio: studio1) }

 let!(:actor1) { Actor.create!(name: "Brad Pitt", age: 52) }
 let!(:actor2) { Actor.create!(name: "The Whale", age:  16) }
 let!(:actor3) { Actor.create!(name: "Jonah Hill", age: 36) }

 let!(:movieactor1) { MovieActor.create!(movie: movie1, actor: actor1) }
 let!(:movieactor2) { MovieActor.create!(movie: movie1, actor: actor2) }
 let!(:movieactor3) { MovieActor.create!(movie: movie1, actor: actor3) }

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe '#actors_by_age' do
    it 'returns actors in age order' do
      expect(movie1.actors).to eq([actor1, actor2, actor3])
      expect(movie1.actors_by_age).to eq([actor2, actor3, actor1])
    end
  end
end
