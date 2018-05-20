class Instructor < ApplicationRecord
  has_many :courses, inverse_of: :instructor
  has_many :reviews, through: :review_instructors
  accepts_nested_attributes_for :courses
  validates_presence_of :first_name, :second_name

  def course=(course_attributes)
    course = Course.new(course_attributes)
    if course.save
      self.courses << course
      self.save
    end
  end

  def course_attributes=(course)
    course = Course.find_or_create_by(course_number: course_number)
    self.courses << course
  end

  def full_name(first_name, second_name)
    self.first_name + " " + self.second_name
  end

  def instructor?
    self.instructor.first_name.nil?
  end

end
