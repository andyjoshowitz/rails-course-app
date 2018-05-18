class Instructor < ApplicationRecord
  has_many :courses, inverse_of: :instructor
  has_many :reviews, through: :review_instructors
  accepts_nested_attributes_for :courses
  validates_presence_of :first_name, :second_name

  def course_attributes=(course)
    self.course = Course.find_or_create_by(course_number: course_number)
    self.course.update(course)
  end

  def full_name(first_name, second_name)
    self.first_name + " " + self.second_name
  end

  def instructor?
    self.instructor.first_name.nil?
  end

end
