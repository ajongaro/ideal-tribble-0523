require 'rails_helper'

RSpec.describe 'the movie show page', type: :feature do
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

 let!(:actor1) { Actor.create!(name: "Brad Pitt", age: 52) }
 let!(:actor2) { Actor.create!(name: "The Whale", age:  16) }
 let!(:actor3) { Actor.create!(name: "Jonah Hill", age: 36) }
 let!(:actor4) { Actor.create!(name: "Elizabeth Hurley", age: 47) }

 let!(:movieactor1) { MovieActor.create!(movie: movie1, actor: actor1) }
 let!(:movieactor2) { MovieActor.create!(movie: movie1, actor: actor2) }
 let!(:movieactor3) { MovieActor.create!(movie: movie1, actor: actor3) }
 let!(:movieactor4) { MovieActor.create!(movie: movie2, actor: actor2) }
 let!(:movieactor5) { MovieActor.create!(movie: movie3, actor: actor3) }
 let!(:movieactor6) { MovieActor.create!(movie: movie3, actor: actor4) }
 let!(:movieactor7) { MovieActor.create!(movie: movie4, actor: actor2) }
 let!(:movieactor8) { MovieActor.create!(movie: movie4, actor: actor4) }
 let!(:movieactor9) { MovieActor.create!(movie: movie5, actor: actor1) }
 let!(:movieactor10) { MovieActor.create!(movie: movie6, actor: actor3) }
 let!(:movieactor11) { MovieActor.create!(movie: movie7, actor: actor1) }

 describe 'visiting the movie show page' do
    it 'displays the movies title, creation year, and genre' do
      visit "/movies/#{movie1.id}"      
      
      within("#movie-info") do
        expect(page).to have_content("Title: Aladdin")
        expect(page).to have_content("Creation Year: 2006")
        expect(page).to have_content("Genre: Animated")
        expect(page).to_not have_content("Free Willy")
      end
    end

    it 'displays a list of all the movies actors from youngest to oldest' do
      visit "/movies/#{movie1.id}"      
      within("#actor-info") do
        expect(page).to have_content("The Whale, Age: 16")
        expect(page).to have_content("Jonah Hill, Age: 36")
        expect(page).to have_content("Brad Pitt, Age: 52")
        expect(page).to_not have_content("Elizabeth Hurley")
      end

      within("#actor-info") do
        expect("The Whale").to appear_before("Jonah Hill")
        expect("The Whale").to appear_before("Brad Pitt")
        expect("Jonah Hill").to appear_before("Bradd Pitt")
      end
    end

    xit 'displays the average age of all the movies actors' do
      visit "/movies/#{movie1.id}"      
      
    end
  end
end