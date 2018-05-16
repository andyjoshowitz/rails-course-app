class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :department
      t.integer :course_number
      t.belongs_to :users
      t.belongs_to :instructors
      t.timestamps
    end
  end
end
