class Instructor < ApplicationRecord
  has_many :courses
  accepts_nested_attributes_for :courses
  validates_presence_of :first_name, :second_name

  def full_name
    self.first_name + " " + self.second_name
  end

  def instructor?
    self.instructor.first_name.nil?
  end

  def overall_rating
    (self.reviews.collect{|r| r.instructor_quality}.inject(0){|sum,x| sum + x }/self.reviews.count.to_f).round(2)
  end

end
