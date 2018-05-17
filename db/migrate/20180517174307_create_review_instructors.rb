class CreateReviewInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :review_instructors do |t|
      t.belongs_to :review
      t.belongs_to :instructor
    end
  end
end
