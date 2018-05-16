class Instructor < ApplicationRecord
  has_many :courses
  accepts_nested_attributes_for :courses
  validates_presence_of :first_name, :second_name

  def self.most_popular_instructors
    joins(:courses).group(:id).order('count(courses.id) DESC')
  end


  def courses_attributes=(courses_attributes)
    courses_attributes.each do |i, courses_attributes|
      if !course_attributes[:title].blank? && !course_attributes[:description].blank?
        if course_attributes[:id].blank?
          self.courses.build(course_attributes)
        else
          course = Course.find_by(id: course_attributes[:id])
          course.update(course_attributes)
        end
      end
    end
  end
end
