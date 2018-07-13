require 'rails_helper'

describe Review do
  describe 'relationships' do
    it 'should belong to a book' do
      book_1 = Book.create!(title:'new book')
      user_1 = User.create!(name:'troll')
      review_1 = book_1.reviews.create!(user:user_1, text:'bad book', rating:1)
      expect(review_1).to respond_to(:book)
    end
    it 'should belong to a user' do
      book_1 = Book.create!(title:'new book')
      user_1 = User.create!(name:'troll')
      review_1 = user_1.reviews.create!(book:book_1, text:'bad book', rating:1)
      expect(review_1).to respond_to(:user)
    end
  end
end
