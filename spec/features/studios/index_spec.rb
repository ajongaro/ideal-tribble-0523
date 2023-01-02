require 'rails_helper'

RSpec.describe 'the studio index page', type: :feature do
 let!(:studio1) { Studio.create!(name: "Universal", location: "Hollywood, CA") }
 let!(:studio2) { Studio.create!(name: "Disney", location: "San Mateo, CA") }
 let!(:studio3) { Studio.create!(name: "Bollywood", location: "Bangalore, IN") }
 let!(:studio4) { Studio.create!(name: "A24", location: "Redondo Beach, CA") }

 let!(:movie1) { Movie.create!(title: "Aladdin", creation_year: 2006, genre: "Animated", studio: studio1) }
 let!(:movie2) { Movie.create!(title: "Hunger Games", creation_year: 2000, genre: "Action", studio: studio2) }
 let!(:movie3) { Movie.create!(title: "Free Willy", creation_year: 1997, genre: "Sad", studio: studio3) }
 let!(:movie4) { Movie.create!(title: "DIE HARD", creation_year: 1999, genre: "Action", studio: studio4) }
 let!(:movie5) { Movie.create!(title: "Another", creation_year: 2006, genre: "Animated", studio: studio1) }
 let!(:movie6) { Movie.create!(title: "Snow White", creation_year: 2000, genre: "Action", studio: studio1) }
 let!(:movie7) { Movie.create!(title: "Training Day", creation_year: 1997, genre: "Sad", studio: studio3) }
 let!(:movie8) { Movie.create!(title: "Borne Identity", creation_year: 1999, genre: "Action", studio: studio4) }

 describe 'the page' do
    it 'has a list of all studios including name and location' do
      visit '/studios'      

      within("#studio-#{studio1.id}") do
        expect(page).to have_content("Universal, Location: Hollywood, CA")
        expect(page).to have_content("Aladdin, 2006, Animated")
        expect(page).to have_content("Another, 2006, Animated")
        expect(page).to have_content("Snow White, 2000, Action")

        expect(page).to_not have_content("DIE HARD")
      end

      within("#studio-#{studio2.id}") do
        expect(page).to have_content("Disney, Location: San Mateo, CA")
        expect(page).to have_content("Hunger Games")

        expect(page).to_not have_content("Aladdin")
      end
    end

    it 'lists each of the studios movies under the studios name and location' do
      visit '/studios'      

      within("#movie-#{movie1.id}") do
        expect(page).to have_content("Aladdin, 2006, Animated")
        expect(page).to_not have_content("Hunger Games")
      end

      within("#movie-#{movie3.id}") do
        expect(page).to have_content("Free Willy, 1997, Sad")
        expect(page).to_not have_content("Snow White")
      end
    end
  end
end