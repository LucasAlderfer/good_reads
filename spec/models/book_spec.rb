require 'rails_helper'

describe Book do
  describe 'relationships' do
    it 'should have many reviews' do
      book_1 = Book.create!(title:'new book')
      expect(book_1).to respond_to(:reviews)
    end
  end

  describe 'instance methods' do
    it 'should have an average rating' do
      book_1 = Book.create!(title:'new book')
      user_1 = User.create!(name:'troll')
      user_2 = User.create!(name:'Godly')
      review_1 = book_1.reviews.create!(user:user_1, text:'bad book', rating:1)
      review_2 = book_1.reviews.create!(user:user_2, text:'good book', rating:5)

      expect(book_1.average_rating).to eq(3)
    end
    it 'should have a highest rating' do
      book_1 = Book.create!(title:'new book')
      user_1 = User.create!(name:'troll')
      user_2 = User.create!(name:'Godly')
      review_1 = book_1.reviews.create!(user:user_1, text:'bad book', rating:1)
      review_2 = book_1.reviews.create!(user:user_2, text:'good book', rating:5)

      expect(book_1.highest_rating).to eq(5)
    end
  end
end
