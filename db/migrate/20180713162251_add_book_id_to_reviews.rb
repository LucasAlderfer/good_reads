class AddBookIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :book, index: true, foreign_key: true
  end
end
