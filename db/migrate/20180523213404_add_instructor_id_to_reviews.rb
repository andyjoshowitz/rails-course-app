class AddInstructorIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :instructor, foreign_key: true
  end
end
