require 'rails_helper'

describe 'visiting /book/:id' do
  context 'as a visitor' do
    it "should show all the book's reviews" do
      book_1 = Book.create!(title:'new book')
      user_1 = User.create!(name:'troll')
      user_2 = User.create!(name:'Godly')
      review_1 = book_1.reviews.create!(user:user_1, text:'bad book', rating:1)
      review_2 = book_1.reviews.create!(user:user_2, text:'good book', rating:5)

      visit book_path(book_1)

      within "#reviews" do
        expect(page).to have_content(review_1.user.name)
        expect(page).to have_content(review_1.text)
        expect(page).to have_content(review_1.rating)
        expect(page).to have_content(review_2.user.name)
        expect(page).to have_content(review_2.text)
        expect(page).to have_content(review_2.rating)
      end
    end
    it "should show the book's average rating" do
      book_1 = Book.create!(title:'new book')
      user_1 = User.create!(name:'troll')
      user_2 = User.create!(name:'Godly')
      review_1 = book_1.reviews.create!(user:user_1, text:'bad book', rating:1)
      review_2 = book_1.reviews.create!(user:user_2, text:'good book', rating:5)

      visit book_path(book_1)

      expect(page).to have_content("Average Rating: #{book_1.average_rating}")
    end
    it "should show the book's highest rating" do
      book_1 = Book.create!(title:'new book')
      user_1 = User.create!(name:'troll')
      user_2 = User.create!(name:'Godly')
      review_1 = book_1.reviews.create!(user:user_1, text:'bad book', rating:1)
      review_2 = book_1.reviews.create!(user:user_2, text:'good book', rating:5)

      visit book_path(book_1)

      expect(page).to have_content("Highest Rating: #{book_1.highest_rating}")
    end
  end
end
