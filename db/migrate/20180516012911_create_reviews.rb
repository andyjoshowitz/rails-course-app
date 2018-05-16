class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :difficulty
      t.integer :course_quality
      t.integer :instructor_quality
      t.integer :amount_learned
      t.integer :work_amount
      t.belongs_to :users
      t.belongs_to :courses
      t.timestamps
    end
  end
end
