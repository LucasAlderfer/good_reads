require 'rails_helper'

describe 'visiting /books' do
  context 'as a visitor' do
    it 'should show all the book titles in the database' do
      book_1 = Book.create!(title:'new book')

      visit books_path

      expect(page).to have_content(book_1.title)
    end
    it "should link to each book's show page" do
      book_1 = Book.create!(title:'new book')

      visit books_path

      click_on book_1.title

      expect(current_path).to eq(book_path(book_1))

      expect(page).to have_content(book_1.title)
    end
  end
end
